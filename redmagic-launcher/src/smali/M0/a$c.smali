.class public final enum LM0/a$c;
.super Ljava/lang/Enum;
.source "ExportedData.java"

# interfaces
.implements Lcom/google/protobuf/A$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LM0/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "LM0/a$c;",
        ">;",
        "Lcom/google/protobuf/A$c;"
    }
.end annotation


# static fields
.field public static final enum h:LM0/a$c;

.field public static final enum i:LM0/a$c;

.field public static final enum j:LM0/a$c;

.field private static final k:Lcom/google/protobuf/A$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/A$d<",
            "LM0/a$c;",
            ">;"
        }
    .end annotation
.end field

.field private static final synthetic l:[LM0/a$c;


# instance fields
.field private final g:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, LM0/a$c;

    .line 2
    .line 3
    const-string v1, "INVALID"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, LM0/a$c;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, LM0/a$c;->h:LM0/a$c;

    .line 10
    .line 11
    new-instance v0, LM0/a$c;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    const v2, 0x65906578

    .line 15
    .line 16
    .line 17
    const-string v3, "MAGIC_NUMBER_L"

    .line 18
    .line 19
    invoke-direct {v0, v3, v1, v2}, LM0/a$c;-><init>(Ljava/lang/String;II)V

    .line 20
    .line 21
    .line 22
    sput-object v0, LM0/a$c;->i:LM0/a$c;

    .line 23
    .line 24
    new-instance v0, LM0/a$c;

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    const v2, 0x68658273

    .line 28
    .line 29
    .line 30
    const-string v3, "MAGIC_NUMBER_H"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, LM0/a$c;-><init>(Ljava/lang/String;II)V

    .line 33
    .line 34
    .line 35
    sput-object v0, LM0/a$c;->j:LM0/a$c;

    .line 36
    .line 37
    invoke-static {}, LM0/a$c;->a()[LM0/a$c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, LM0/a$c;->l:[LM0/a$c;

    .line 42
    .line 43
    new-instance v0, LM0/a$c$a;

    .line 44
    .line 45
    invoke-direct {v0}, LM0/a$c$a;-><init>()V

    .line 46
    .line 47
    .line 48
    sput-object v0, LM0/a$c;->k:Lcom/google/protobuf/A$d;

    .line 49
    .line 50
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, LM0/a$c;->g:I

    .line 5
    .line 6
    return-void
.end method

.method private static synthetic a()[LM0/a$c;
    .locals 3

    .line 1
    sget-object v0, LM0/a$c;->h:LM0/a$c;

    .line 2
    .line 3
    sget-object v1, LM0/a$c;->i:LM0/a$c;

    .line 4
    .line 5
    sget-object v2, LM0/a$c;->j:LM0/a$c;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [LM0/a$c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static c(I)LM0/a$c;
    .locals 1

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    const v0, 0x65906578

    .line 4
    .line 5
    .line 6
    if-eq p0, v0, :cond_1

    .line 7
    .line 8
    const v0, 0x68658273

    .line 9
    .line 10
    .line 11
    if-eq p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0

    .line 15
    :cond_0
    sget-object p0, LM0/a$c;->j:LM0/a$c;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_1
    sget-object p0, LM0/a$c;->i:LM0/a$c;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_2
    sget-object p0, LM0/a$c;->h:LM0/a$c;

    .line 22
    .line 23
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)LM0/a$c;
    .locals 1

    .line 1
    const-class v0, LM0/a$c;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LM0/a$c;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LM0/a$c;
    .locals 1

    .line 1
    sget-object v0, LM0/a$c;->l:[LM0/a$c;

    .line 2
    .line 3
    invoke-virtual {v0}, [LM0/a$c;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LM0/a$c;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .locals 0

    .line 1
    iget p0, p0, LM0/a$c;->g:I

    .line 2
    .line 3
    return p0
.end method
