.class abstract Lcom/google/protobuf/I;
.super Ljava/lang/Object;
.source "ListFieldSchema.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/protobuf/I$c;,
        Lcom/google/protobuf/I$b;
    }
.end annotation


# static fields
.field private static final a:Lcom/google/protobuf/I;

.field private static final b:Lcom/google/protobuf/I;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/protobuf/I$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/google/protobuf/I$b;-><init>(Lcom/google/protobuf/I$a;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/google/protobuf/I;->a:Lcom/google/protobuf/I;

    .line 8
    .line 9
    new-instance v0, Lcom/google/protobuf/I$c;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Lcom/google/protobuf/I$c;-><init>(Lcom/google/protobuf/I$a;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/google/protobuf/I;->b:Lcom/google/protobuf/I;

    .line 15
    .line 16
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/I$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/I;-><init>()V

    return-void
.end method

.method static a()Lcom/google/protobuf/I;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/protobuf/I;->a:Lcom/google/protobuf/I;

    .line 2
    .line 3
    return-object v0
.end method

.method static b()Lcom/google/protobuf/I;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/protobuf/I;->b:Lcom/google/protobuf/I;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method abstract c(Ljava/lang/Object;J)V
.end method

.method abstract d(Ljava/lang/Object;Ljava/lang/Object;J)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<",
            "L:Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "J)V"
        }
    .end annotation
.end method

.method abstract e(Ljava/lang/Object;J)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<",
            "L:Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "J)",
            "Ljava/util/List<",
            "T",
            "L;",
            ">;"
        }
    .end annotation
.end method
