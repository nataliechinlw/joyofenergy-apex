public without sharing class ReadingsStub {
    @AuraEnabled
    public static void initReadings(Id clientId){
        if (clientId == null) {
            return;
        }

        if ([select count() from Reading__c where Client__c = :clientId] > 0) {
            return;
        }
        
        List<Reading__c> readings = new List<Reading__c>();
        Integer count = Math.round(Math.random() * 1000);
        for (Integer i = 0; i < count; i++) {
            Reading__c reading = new Reading__c();
            reading.Client__c = clientId;
            reading.ReadingTime__c = DateTime.now().addHours(-1 * i);
            reading.Value__c = Math.random() * 5;
            readings.add(reading);
        }

        if (!readings.isEmpty()) {
            insert readings;
        }
    }
}