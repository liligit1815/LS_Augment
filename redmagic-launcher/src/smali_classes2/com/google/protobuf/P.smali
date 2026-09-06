.class final Lcom/google/protobuf/P;
.super Ljava/lang/Object;
.source "MapFieldSchemas.java"


# static fields
.field private static final a:Lcom/google/protobuf/N;

.field private static final b:Lcom/google/protobuf/N;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/P;->c()Lcom/google/protobuf/N;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/google/protobuf/P;->a:Lcom/google/protobuf/N;

    .line 6
    .line 7
    new-instance v0, Lcom/google/protobuf/O;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/google/protobuf/O;-><init>()V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/google/protobuf/P;->b:Lcom/google/protobuf/N;

    .line 13
    .line 14
    return-void
.end method

.method static a()Lcom/google/protobuf/N;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/protobuf/P;->a:Lcom/google/protobuf/N;

    .line 2
    .line 3
    return-object v0
.end method

.method static b()Lcom/google/protobuf/N;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/protobuf/P;->b:Lcom/google/protobuf/N;

    .line 2
    .line 3
    return-object v0
.end method

.method private static c()Lcom/google/protobuf/N;
    .locals 3

    .line 1
    :try_start_0
    const-string v0, "com.google.protobuf.MapFieldSchemaFull"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    new-array v2, v1, [Ljava/lang/Class;

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-array v1, v1, [Ljava/lang/Object;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/google/protobuf/N;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    return-object v0

    .line 23
    :catch_0
    const/4 v0, 0x0

    .line 24
    return-object v0
.end method
