.class public final Lo0/C$b;
.super Ljava/lang/Object;
.source "SplitController.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lo0/C;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lo0/C$b$a;
    }
.end annotation


# static fields
.field public static final b:Lo0/C$b$a;

.field public static final c:Lo0/C$b;

.field public static final d:Lo0/C$b;

.field public static final e:Lo0/C$b;


# instance fields
.field private final a:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lo0/C$b$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lo0/C$b$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lo0/C$b;->b:Lo0/C$b$a;

    .line 8
    .line 9
    new-instance v0, Lo0/C$b;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-direct {v0, v1}, Lo0/C$b;-><init>(I)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lo0/C$b;->c:Lo0/C$b;

    .line 16
    .line 17
    new-instance v0, Lo0/C$b;

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-direct {v0, v1}, Lo0/C$b;-><init>(I)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lo0/C$b;->d:Lo0/C$b;

    .line 24
    .line 25
    new-instance v0, Lo0/C$b;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    invoke-direct {v0, v1}, Lo0/C$b;-><init>(I)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lo0/C$b;->e:Lo0/C$b;

    .line 32
    .line 33
    return-void
.end method

.method private constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lo0/C$b;->a:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    iget p0, p0, Lo0/C$b;->a:I

    .line 2
    .line 3
    if-eqz p0, :cond_2

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-eq p0, v0, :cond_1

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    if-eq p0, v0, :cond_0

    .line 10
    .line 11
    const-string p0, "UNKNOWN"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, "SplitSupportStatus: ERROR_SPLIT_PROPERTY_NOT_DECLARED"

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    const-string p0, "SplitSupportStatus: UNAVAILABLE"

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_2
    const-string p0, "SplitSupportStatus: AVAILABLE"

    .line 21
    .line 22
    return-object p0
.end method
