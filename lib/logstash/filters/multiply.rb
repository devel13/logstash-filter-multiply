# encoding: utf-8
require "logstash/filters/base"

# This  filter will replace the contents of the default
# message field with whatever you specify in the configuration.
#
# It is only intended to be used as an .
class LogStash::Filters::Multiply < LogStash::Filters::Base

  # Setting the config_name here is required. This is how you
  # configure this filter from your Logstash config.
  #
  # filter {
  #    {
  #     message => "My message..."
  #   }
  # }
  #
  config_name "multiply"

  # Replace the message with this value.
  config :message, :validate => :string, :default => "Hello World!"


  public
  def register
    # Add instance variables
  end # def register

  public
  def filter(event)

    eventAmmount = event.get("amount").to_i
    multiply = eventAmmount * @inputNumber.to_i
    event.set("multipliedValue", multiply)

    #if @message
    #  # Replace the event message with our message as configured in the
    #  # config file.
    #  event.set("message", @message)
    #end

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Multiply
