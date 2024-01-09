from models import Ticket


def check_ticket_validity() : 
    tickets = Ticket.objects.get(Ticket_barcode="abdenour")
    tickets.Ticket_barcode = "belarbi"
    tickets.save()



