require "avm/version"
require "avm/dimension"
require "avm/element"
require "avm/xmp"
require "avm/subject_category"
require "avm/vocabulary"
require "avm/search"
require "avm/pre_flight"

module Avm
  class Error < StandardError; end
  # Your code goes here...
  # Bootstrap the class methods
  def self.included(klass)
    klass.extend ClassMethods
    klass.before_save   :require_avm_attachment_name
    klass.after_create  :scrape_avm_data!
    klass.after_destroy :destroy_avm_data_record!
  end

  #
  # Class Methods
  #
  module ClassMethods
    def attach_avm_data(attachment_name)
      define_singleton_method :avm_attachment_name do
        attachment_name
      end
    end

    def search_avm(values, tag_names = nil, options={})
      AvmData.search(values, tag_names, options.merge!(record_type: self.name))
    end
  end

  #
  # Instance Methods
  #
  def avm_data
    self.avm_data_record.tags
  end

  def avm_data=(data)
    transaction do
      record = self.avm_data_record
      record.tags = data
      record.save
      # populate_url_slug!
      # populate_related_id!
      # populate_reference_url!
      populate_name!
    end
    transaction do
      self.stamp_avm_data! unless self.class.avm_attachment_name == :none
    end
  end

  def avm_master_file_url
    attachment = self.class.avm_attachment_name
    host_name = APP_CONFIG["site_url"]
    url = self.send(attachment).url(:original).split("?").first
    return host_name + url
  end

  protected

  def avm_data_record
    record = AvmData.find_by(record_id: self.id, record_type: self.class.name)
    unless record
      record = AvmData.new(record_id: self.id, record_type: self.class.name)
    end
    return record
  end

  def destroy_avm_data_record!
    self.avm_data_record.destroy
  end

  def scrape_avm_data!
    attachment = self.class.avm_attachment_name
    if attachment == :none
      self.avm_data = Avm::Element.empty
    else
      path = self.send(attachment).queued_for_write[:original].path
      avm_data = Avm::Xmp.read(path).merge(Avm::Element.default_values){|key, old, default| old.nil? ? default : old }
      self.avm_data = avm_data
    end
  end

  def stamp_avm_data!
    attachment = self.class.avm_attachment_name
    if self.send(attachment).queued_for_write.present?
      Avm::Xmp.write(self.send(attachment).queued_for_write[:original].path, self.avm_data)
      self.send(attachment).styles.values.each do |style|
        Avm::Xmp.write(self.send(attachment).queued_for_write[style.name].path, self.avm_data)
      end
    else
      Avm::Xmp.write(self.send(attachment).path(:original), self.avm_data)
      self.send(attachment).styles.values.each do |style|
        Avm::Xmp.write(self.send(attachment).path(style.name), self.avm_data)
      end
    end
  end

  def require_avm_attachment_name
    if self.class.respond_to?(:avm_attachment_name)
      true
    else
      raise "Please define avm_attachment_name with: 'attach_avm_data :avatar' in your model '#{self.class.name}'.".inspect
    end
  end

  def populate_url_slug!
    avm_title = self.avm_data["image_id"]
    avm_title += " "
    avm_title += self.avm_data["title"]
    if self.respond_to?(:url_slug) && avm_title.present?
      url_slug = self.class.condition_url_slug(avm_title)
      if (Float(url_slug) rescue false)
        url_slug += "-" + self.class.name
      end
      update_column(:url_slug, url_slug)
    end
  end

  def populate_related_id!
    avm_image_id = self.avm_data["image_id"]
    if self.respond_to?(:related_id) && avm_image_id.present?
      update_column(:related_id, avm_image_id)
    end
  end

  def populate_reference_url!
    host_name = APP_CONFIG["site_url"]
    record = self.avm_data_record
    record.tags["reference_url"] = host_name + self.url
    record.save
  end

  def populate_name!
    name = self.avm_data["title"]
    if self.respond_to?(:name) && name.present?
      update_column(:name, name)
    end
  end
end
