require 'rails_helper'

RSpec.describe Park do
  it "exists" do
    attrs = {
      fullName: "Colorado National Park",
      description: "Cool park",
      directionsInfo: "Use the highway",
      operatingHours: [{:exceptions=>
           [{:exceptionHours=>{}, :startDate=>"2020-11-26", :name=>"Closed for Thanksgiving", :endDate=>"2020-11-26"},
            {:exceptionHours=>{}, :startDate=>"2020-12-25", :name=>"Closed for Christmas Day", :endDate=>"2020-12-25"},
            {:exceptionHours=>{}, :startDate=>"2021-01-01", :name=>"Closed New Year's Day", :endDate=>"2021-01-01"}],
          :description=>
           "Following guidance from the White House, Centers for Disease Control and Prevention, and state and local public health authorities, the Andrew Johnson NHS is increasing access and services in a phased approach. The site is currently open from 10:00 a.m. until 3:00 p.m. Monday - Friday only. Due to the limited space inside the president's Homestead, tours are cancelled until further notice.",
          :standardHours=>
           {:wednesday=>"10:00AM - 3:00PM",
            :monday=>"10:00AM - 3:00PM",
            :thursday=>"10:00AM - 3:00PM",
            :sunday=>"Closed",
            :tuesday=>"10:00AM - 3:00PM",
            :friday=>"10:00AM - 3:00PM",
            :saturday=>"Closed"},
          :name=>"Andrew Johnson National Historic Site"}]
    }

    park = Park.new(attrs)

    expect(park).to be_a Park
    expect(park.name).to eq("Colorado National Park")
    expect(park.description).to eq("Cool park")
    expect(park.directions).to eq("Use the highway")
    expect(park.hours).to eq({:wednesday=>"10:00AM - 3:00PM",
             :monday=>"10:00AM - 3:00PM",
             :thursday=>"10:00AM - 3:00PM",
             :sunday=>"Closed",
             :tuesday=>"10:00AM - 3:00PM",
             :friday=>"10:00AM - 3:00PM",
             :saturday=>"Closed"})
  end
end
