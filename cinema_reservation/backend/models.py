from django.db import models



class Cinema(models.Model):
    Cinema_ID = models.AutoField(primary_key=True)
    Cinema_name = models.TextField()
    Cinema_location = models.TextField()
    Cinema_description = models.TextField()
    Cinema_image = models.TextField()
    Cinema_closing = models.TextField()


class Movie(models.Model):
    Movie_ID = models.AutoField(primary_key=True)
    Movie_title = models.TextField()
    Movie_category = models.TextField()
    Movie_description = models.TextField()
    Movie_duration = models.TimeField(null=True, blank=True)
    Movie_director = models.TextField()
    Movie_path = models.TextField()

class CastPath(models.Model):
    ID = models.AutoField(primary_key=True)
    Movie_id = models.ForeignKey(Movie,on_delete=models.CASCADE,null=True,blank=True)
    Actor_path = models.CharField(max_length=255, null=True, blank=True)
    actor_name = models.TextField()



class ImagesPath(models.Model):
    ID = models.AutoField(primary_key=True)
    Movie_id = models.ForeignKey(Movie,on_delete=models.CASCADE,null=True,blank=True)
    Image_path = models.CharField(max_length=255, null=True, blank=True)




class Room(models.Model):
    Room_ID = models.AutoField(primary_key=True)
    Room_number = models.IntegerField(null=True, blank=True)
    Room_capacity = models.IntegerField(null=True, blank=True)
    Cinema_ID = models.ForeignKey(Cinema, on_delete=models.CASCADE, null=True, blank=True)

class Seat(models.Model):
    Seat_ID = models.AutoField(primary_key=True)
    Seat_reference = models.TextField()
    Room_ID = models.ForeignKey(Room, on_delete=models.CASCADE, null=True, blank=True)
    Seat_state = models.IntegerField(null=True, blank=True)

class Session(models.Model):
    Session_ID = models.AutoField(primary_key=True)
    Session_movie = models.ForeignKey(Movie, on_delete=models.CASCADE, null=True, blank=True)
    Session_time = models.DateTimeField(null=True, blank=True)
    Session_room = models.ForeignKey(Room, on_delete=models.CASCADE, null=True, blank=True)
    Session_version = models.TextField()
    Session_price = models.IntegerField(null=True, blank=True)


class User(models.Model):
    User_ID = models.AutoField(primary_key=True)
    User_name = models.TextField()
    User_email = models.EmailField(null=True, blank=True)
    User_password = models.CharField(max_length=45, null=True, blank=True)
    User_phone_number = models.TextField()

class Ticket(models.Model):
    Seat_ID = models.ForeignKey(Seat, on_delete=models.CASCADE, null=True, blank=True)
    User_ID = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
    Ticket_time = models.DateTimeField(null=True, blank=True)
    Ticket_barcode = models.TextField()
    Session_ID = models.ForeignKey(Session, on_delete=models.CASCADE, null=True, blank=True)




class Todo(models.Model):

    content = models.CharField(max_length=50)
    title = models.TextField()
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.content


