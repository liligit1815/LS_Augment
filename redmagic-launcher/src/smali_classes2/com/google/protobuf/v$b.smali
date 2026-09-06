.class final enum Lcom/google/protobuf/v$b;
.super Ljava/lang/Enum;
.source "FieldType.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/v;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/protobuf/v$b;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum h:Lcom/google/protobuf/v$b;

.field public static final enum i:Lcom/google/protobuf/v$b;

.field public static final enum j:Lcom/google/protobuf/v$b;

.field public static final enum k:Lcom/google/protobuf/v$b;

.field private static final synthetic l:[Lcom/google/protobuf/v$b;


# instance fields
.field private final g:Z


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lcom/google/protobuf/v$b;

    .line 2
    .line 3
    const-string v1, "SCALAR"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/google/protobuf/v$b;-><init>(Ljava/lang/String;IZ)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/google/protobuf/v$b;->h:Lcom/google/protobuf/v$b;

    .line 10
    .line 11
    new-instance v1, Lcom/google/protobuf/v$b;

    .line 12
    .line 13
    const-string v3, "VECTOR"

    .line 14
    .line 15
    const/4 v4, 0x1

    .line 16
    invoke-direct {v1, v3, v4, v4}, Lcom/google/protobuf/v$b;-><init>(Ljava/lang/String;IZ)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/google/protobuf/v$b;->i:Lcom/google/protobuf/v$b;

    .line 20
    .line 21
    new-instance v3, Lcom/google/protobuf/v$b;

    .line 22
    .line 23
    const-string v5, "PACKED_VECTOR"

    .line 24
    .line 25
    const/4 v6, 0x2

    .line 26
    invoke-direct {v3, v5, v6, v4}, Lcom/google/protobuf/v$b;-><init>(Ljava/lang/String;IZ)V

    .line 27
    .line 28
    .line 29
    sput-object v3, Lcom/google/protobuf/v$b;->j:Lcom/google/protobuf/v$b;

    .line 30
    .line 31
    new-instance v4, Lcom/google/protobuf/v$b;

    .line 32
    .line 33
    const-string v5, "MAP"

    .line 34
    .line 35
    const/4 v6, 0x3

    .line 36
    invoke-direct {v4, v5, v6, v2}, Lcom/google/protobuf/v$b;-><init>(Ljava/lang/String;IZ)V

    .line 37
    .line 38
    .line 39
    sput-object v4, Lcom/google/protobuf/v$b;->k:Lcom/google/protobuf/v$b;

    .line 40
    .line 41
    filled-new-array {v0, v1, v3, v4}, [Lcom/google/protobuf/v$b;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcom/google/protobuf/v$b;->l:[Lcom/google/protobuf/v$b;

    .line 46
    .line 47
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-boolean p3, p0, Lcom/google/protobuf/v$b;->g:Z

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/protobuf/v$b;
    .locals 1

    .line 1
    const-class v0, Lcom/google/protobuf/v$b;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/google/protobuf/v$b;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/google/protobuf/v$b;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/protobuf/v$b;->l:[Lcom/google/protobuf/v$b;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/google/protobuf/v$b;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/google/protobuf/v$b;

    .line 8
    .line 9
    return-object v0
.end method
