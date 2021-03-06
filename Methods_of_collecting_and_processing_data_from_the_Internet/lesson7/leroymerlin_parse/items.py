# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy
from itemloaders.processors import TakeFirst, MapCompose


def process_price(value):
    try:
        value = value.replace(' ', '')
        value = int(value)
    except Exception as err:
        print(err)
    finally:
        return value


class LeroymerlinParseItem(scrapy.Item):
    # define the fields for your item here like:
    _id = scrapy.Field()
    name = scrapy.Field(output_processor=TakeFirst())
    url = scrapy.Field(output_processor=TakeFirst())
    price = scrapy.Field(output_processor=TakeFirst(), input_processor=MapCompose(process_price))
    photos = scrapy.Field()
    feature_names = scrapy.Field()
    feature_values = scrapy.Field()
    features = scrapy.Field()
