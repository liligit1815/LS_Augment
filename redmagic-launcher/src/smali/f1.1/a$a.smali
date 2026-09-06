.class public final enum Lf1/a$a;
.super Ljava/lang/Enum;
.source "FeatureFlags.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lf1/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lf1/a$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum h:Lf1/a$a;

.field public static final enum i:Lf1/a$a;

.field private static final synthetic j:[Lf1/a$a;


# instance fields
.field private final g:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lf1/a$a;

    .line 2
    .line 3
    const-string v1, "ENABLED"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lf1/a$a;-><init>(Ljava/lang/String;IZ)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lf1/a$a;->h:Lf1/a$a;

    .line 11
    .line 12
    new-instance v0, Lf1/a$a;

    .line 13
    .line 14
    const-string v1, "DISABLED"

    .line 15
    .line 16
    invoke-direct {v0, v1, v3, v2}, Lf1/a$a;-><init>(Ljava/lang/String;IZ)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lf1/a$a;->i:Lf1/a$a;

    .line 20
    .line 21
    invoke-static {}, Lf1/a$a;->a()[Lf1/a$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lf1/a$a;->j:[Lf1/a$a;

    .line 26
    .line 27
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
    iput-boolean p3, p0, Lf1/a$a;->g:Z

    .line 5
    .line 6
    return-void
.end method

.method private static synthetic a()[Lf1/a$a;
    .locals 2

    .line 1
    sget-object v0, Lf1/a$a;->h:Lf1/a$a;

    .line 2
    .line 3
    sget-object v1, Lf1/a$a;->i:Lf1/a$a;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lf1/a$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lf1/a$a;
    .locals 1

    .line 1
    const-class v0, Lf1/a$a;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lf1/a$a;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lf1/a$a;
    .locals 1

    .line 1
    sget-object v0, Lf1/a$a;->j:[Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lf1/a$a;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lf1/a$a;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lf1/a$a;->g:Z

    .line 2
    .line 3
    return p0
.end method
