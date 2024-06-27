# Generated by Django 5.0.3 on 2024-06-11 06:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('booking', '0038_flight_crudoperations'),
    ]

    operations = [
        migrations.CreateModel(
            name='crudoperations',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('card', models.CharField(max_length=100)),
                ('url', models.URLField()),
            ],
        ),
        migrations.DeleteModel(
            name='flight_crudoperations',
        ),
    ]
