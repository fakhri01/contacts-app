import 'package:contacts/models/contacts_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<ContactsModel> contactsList = [
  ContactsModel(
    id: 1,
    name: 'John Doe',
    email: 'john.doe@example.com',
    number: 1234567890,
  ),
  ContactsModel(
    id: 2,
    name: 'Jane Smith',
    email: 'jane.smith@example.com',
    number: 9876543210,
  ),
  ContactsModel(
    id: 3,
    name: 'Robert Johnson',
    email: 'robert.j@example.com',
    number: 5551122334,
  ),
  ContactsModel(
    id: 4,
    name: 'Emily White',
    email: 'emily.w@example.com',
    number: 1239876543,
  ),
  ContactsModel(
    id: 5,
    name: 'Michael Brown',
    email: 'michael.b@example.com',
    number: 4443322110,
  ),
  ContactsModel(
    id: 6,
    name: 'Sarah Davis',
    email: 'sarah.d@example.com',
    number: 9988776655,
  ),
  ContactsModel(
    id: 7,
    name: 'David Wilson',
    email: 'david.w@example.com',
    number: 1122334455,
  ),
  ContactsModel(
    id: 8,
    name: 'Jessica Miller',
    email: 'jessica.m@example.com',
    number: 6677889900,
  ),
  ContactsModel(
    id: 9,
    name: 'Chris Evans',
    email: 'chris.e@example.com',
    number: 1234512345,
  ),
  ContactsModel(
    id: 10,
    name: 'Laura Martinez',
    email: 'laura.m@example.com',
    number: 9876598765,
  ),
  ContactsModel(
    id: 11,
    name: 'Daniel Taylor',
    email: 'daniel.t@example.com',
    number: 5556667778,
  ),
  ContactsModel(
    id: 12,
    name: 'Olivia Anderson',
    email: 'olivia.a@example.com',
    number: 1112223334,
  ),
  ContactsModel(
    id: 13,
    name: 'James Thomas',
    email: 'james.t@example.com',
    number: 4445556667,
  ),
  ContactsModel(
    id: 14,
    name: 'Sophia Lee',
    email: 'sophia.l@example.com',
    number: 9998887776,
  ),
  ContactsModel(
    id: 15,
    name: 'Andrew Clark',
    email: 'andrew.c@example.com',
    number: 7776665554,
  ),
];

class ContactsNotifier extends StateNotifier<List<ContactsModel>> {
  ContactsNotifier() : super(contactsList);

  void deleteContact(int id) {
    state = state.where((element) => element.id != id).toList();
  }
}

final contactsProvider =
    StateNotifierProvider<ContactsNotifier, List<ContactsModel>>(
      (ref) => ContactsNotifier(),
    );

final contactFinderProvider = Provider.family<ContactsModel?, int>((
  ref,
  contactId,
) {
  final contacts = ref.watch(contactsProvider);

  for (final contact in contacts) {
    if (contact.id == contactId) {
      return contact;
    }
  }

  return null;
});
