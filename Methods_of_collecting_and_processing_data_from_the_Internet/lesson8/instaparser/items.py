# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class InstaparserItem(scrapy.Item):
    # define the fields for your item here like:
    follow_id = scrapy.Field()
    follow_username = scrapy.Field()
    photo = scrapy.Field()
    user_id = scrapy.Field()
    username = scrapy.Field()
    type = scrapy.Field()
    _id = scrapy.Field()
