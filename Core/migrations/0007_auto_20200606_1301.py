# Generated by Django 3.0.4 on 2020-06-06 13:01

from django.db import migrations
import django_ckeditor_5.fields


class Migration(migrations.Migration):

    dependencies = [
        ('Core', '0006_auto_20200410_1538'),
    ]

    operations = [
        migrations.AlterField(
            model_name='documents',
            name='docContent',
            field=django_ckeditor_5.fields.CKEditor5Field(verbose_name='Text'),
        ),
    ]
