ShardMapManager smm = ShardMapManagerFactory.getSqlShardMapManager(connectionString, ShardMapManagerLoadPolicy.Lazy);
RangeShardMap<int> rangeShardMap = smm.getRangeShardMap(Configuration.getRangeShardMapName(), ShardKeyType.Int32);
// Syntax:
public Connection openConnectionForKey(Object key, String connectionString, ConnectionOptions options)
int customerId = 12345;
int productId = 4321;
// Looks up the key in the shard map and opens a connection to the shard
try (Connection conn = shardMap.openConnectionForKey(customerId, Configuration.getCredentialsConnectionString())) {
    // Create a simple command that will insert or update the customer information
    PreparedStatement ps = conn.prepareStatement("UPDATE Sales.Customer SET PersonID = ? WHERE CustomerID = ?");

    ps.setInt(1, productId);
    ps.setInt(2, customerId);
    ps.executeUpdate();
} catch (SQLException e) {
    e.printStackTrace();
}
int customerId = 12345;
int productId = 4321;
try {
    SqlDatabaseUtils.getSqlRetryPolicy().executeAction(() -> {
        // Looks up the key in the shard map and opens a connection to the shard
        try (Connection conn = shardMap.openConnectionForKey(customerId, Configuration.getCredentialsConnectionString())) {
            // Create a simple command that will insert or update the customer information
            PreparedStatement ps = conn.prepareStatement("UPDATE Sales.Customer SET PersonID = ? WHERE CustomerID = ?");

            ps.setInt(1, productId);
            ps.setInt(2, customerId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    });
} catch (Exception e) {
    throw new StoreException(e.getMessage(), e);
}
ShardMapManager smm = ShardMapManagerFactory.GetSqlShardMapManager(smmConnectionString,  
          ShardMapManagerLoadPolicy.Lazy);
          RecoveryManager rm = smm.GetRecoveryManager();
rm.DetachShard(s.Location, customerMap);
rm.DetectMappingDifferences(location, shardMapName);
ResolveMappingDifferences (RecoveryToken, MappingDifferenceResolution.KeepShardMapping);
rm.AttachShard(location, shardMapName)
rm.AttachShard(s.Location, customerMap);
var gs = rm.DetectMappingDifferences(s.Location);
   foreach (RecoveryToken g in gs)
    {
    rm.ResolveMappingDifferences(g, MappingDifferenceResolution.KeepShardMapping);
    }
    var shards = smm.GetShards();
foreach (shard s in shards)
{
  if (s.Location.Server == Configuration.PrimaryServer)
      {
       ShardLocation slNew = new ShardLocation(Configuration.SecondaryServer, s.Location.Database);
       rm.DetachShard(s.Location);
       rm.AttachShard(slNew);
       var gs = rm.DetectMappingDifferences(slNew);
       foreach (RecoveryToken g in gs)
         {
            rm.ResolveMappingDifferences(g, MappingDifferenceResolution.KeepShardMapping);
         }
     }
 }
 
