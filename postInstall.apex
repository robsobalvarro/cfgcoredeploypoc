// Anonymous Apex Script to Create Party Role Relationship Records
List<PartyRoleRelation> partyRoleRelationships = new List<PartyRoleRelation>();

// Define the relationship pairs using a wrapper class
public class RelationshipPair {
   public String roleName;
   public String relatedRoleName;

   public RelationshipPair(String role, String relatedRole) {
         this.roleName = role;
         this.relatedRoleName = relatedRole;
   }
}

// Create list of relationship pairs
List<RelationshipPair> relationshipPairs = new List<RelationshipPair>{
   new RelationshipPair('Brother', 'Brother'),
   new RelationshipPair('Brother', 'Sister'),
   new RelationshipPair('Sister', 'Sister'),
   new RelationshipPair('Sibling', 'Sibling'),
   new RelationshipPair('Mother', 'Son'),
   new RelationshipPair('Mother', 'Daughter'),
   new RelationshipPair('Father', 'Son'),
   new RelationshipPair('Father', 'Daughter'),
   new RelationshipPair('Wife', 'Husband'),
   new RelationshipPair('Spouse', 'Spouse'),
   new RelationshipPair('Former Spouse', 'Former Spouse'),
   new RelationshipPair('Grandparent', 'Grandchild'),
   new RelationshipPair('Uncle', 'Nephew'),
   new RelationshipPair('Uncle', 'Niece'),
   new RelationshipPair('Aunt', 'Nephew'),
   new RelationshipPair('Aunt', 'Niece'),
   new RelationshipPair('Cousin', 'Cousin'),
   new RelationshipPair('Colleague', 'Colleague'),
   new RelationshipPair('Employer', 'Employee'),
   new RelationshipPair('Teacher', 'Student'),
   new RelationshipPair('Mentor', 'Mentee')
};

// Create Party Role Relationship records
for (RelationshipPair pair : relationshipPairs) {
   PartyRoleRelation partyRole = new PartyRoleRelation();
   partyRole.Name = pair.roleName + ' - ' + pair.relatedRoleName; // Record
   partyRole.RelationshipObjectName = 'Contact_Contact_Relationship'; // Relationship Object Name
   partyRole.RoleName = pair.roleName; // Role Name
   partyRole.RelatedRoleName = pair.relatedRoleName; // Related Role Name
   if (pair.roleName == pair.RelatedRoleName) {
      partyRole.ShouldCreaInversRoleAuto = false; // role and related role can't be the same
   }
   else {
      partyRole.ShouldCreaInversRoleAuto = true; // Create Inverse Role
   }
   
   partyRoleRelationships.add(partyRole);
}

try {
   insert partyRoleRelationships;
   System.debug('Successfully created ' + partyRoleRelationships.size() + ' Party Role Relationship records');

   // Output the created records
   for (PartyRoleRelation record : partyRoleRelationships) {
         System.debug('Created: ' + record.Name + ' (ID: ' + record.Id + ')');
         System.debug('  Role: ' + record.RoleName + ' -> Related Role: ' + record.RelatedRoleName);
   }
} catch (Exception e) {
   System.debug('Error creating Party Role Relationship records: ' + e.getMessage());
   System.debug('Stack trace: ' + e.getStackTraceString());
}
