.class public final Lo0/B$c;
.super Ljava/lang/Object;
.source "SplitAttributes.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lo0/B;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lo0/B$c$a;
    }
.end annotation


# static fields
.field public static final c:Lo0/B$c$a;

.field public static final d:Lo0/B$c;

.field public static final e:Lo0/B$c;

.field public static final f:Lo0/B$c;

.field public static final g:Lo0/B$c;

.field public static final h:Lo0/B$c;


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lo0/B$c$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lo0/B$c$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lo0/B$c;->c:Lo0/B$c$a;

    .line 8
    .line 9
    new-instance v0, Lo0/B$c;

    .line 10
    .line 11
    const-string v1, "LOCALE"

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-direct {v0, v1, v2}, Lo0/B$c;-><init>(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lo0/B$c;->d:Lo0/B$c;

    .line 18
    .line 19
    new-instance v0, Lo0/B$c;

    .line 20
    .line 21
    const-string v1, "LEFT_TO_RIGHT"

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    invoke-direct {v0, v1, v2}, Lo0/B$c;-><init>(Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lo0/B$c;->e:Lo0/B$c;

    .line 28
    .line 29
    new-instance v0, Lo0/B$c;

    .line 30
    .line 31
    const-string v1, "RIGHT_TO_LEFT"

    .line 32
    .line 33
    const/4 v2, 0x2

    .line 34
    invoke-direct {v0, v1, v2}, Lo0/B$c;-><init>(Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    sput-object v0, Lo0/B$c;->f:Lo0/B$c;

    .line 38
    .line 39
    new-instance v0, Lo0/B$c;

    .line 40
    .line 41
    const-string v1, "TOP_TO_BOTTOM"

    .line 42
    .line 43
    const/4 v2, 0x3

    .line 44
    invoke-direct {v0, v1, v2}, Lo0/B$c;-><init>(Ljava/lang/String;I)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lo0/B$c;->g:Lo0/B$c;

    .line 48
    .line 49
    new-instance v0, Lo0/B$c;

    .line 50
    .line 51
    const-string v1, "BOTTOM_TO_TOP"

    .line 52
    .line 53
    const/4 v2, 0x4

    .line 54
    invoke-direct {v0, v1, v2}, Lo0/B$c;-><init>(Ljava/lang/String;I)V

    .line 55
    .line 56
    .line 57
    sput-object v0, Lo0/B$c;->h:Lo0/B$c;

    .line 58
    .line 59
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lo0/B$c;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lo0/B$c;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, Lo0/B$c;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lo0/B$c;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
