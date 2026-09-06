.class public final Lo0/H$d;
.super Ljava/lang/Object;
.source "SplitRule.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lo0/H;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lo0/H$d$a;
    }
.end annotation


# static fields
.field public static final c:Lo0/H$d$a;

.field public static final d:Lo0/H$d;

.field public static final e:Lo0/H$d;

.field public static final f:Lo0/H$d;


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lo0/H$d$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lo0/H$d$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lo0/H$d;->c:Lo0/H$d$a;

    .line 8
    .line 9
    new-instance v0, Lo0/H$d;

    .line 10
    .line 11
    const-string v1, "NEVER"

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-direct {v0, v1, v2}, Lo0/H$d;-><init>(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lo0/H$d;->d:Lo0/H$d;

    .line 18
    .line 19
    new-instance v0, Lo0/H$d;

    .line 20
    .line 21
    const-string v1, "ALWAYS"

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    invoke-direct {v0, v1, v2}, Lo0/H$d;-><init>(Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lo0/H$d;->e:Lo0/H$d;

    .line 28
    .line 29
    new-instance v0, Lo0/H$d;

    .line 30
    .line 31
    const-string v1, "ADJACENT"

    .line 32
    .line 33
    const/4 v2, 0x2

    .line 34
    invoke-direct {v0, v1, v2}, Lo0/H$d;-><init>(Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    sput-object v0, Lo0/H$d;->f:Lo0/H$d;

    .line 38
    .line 39
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lo0/H$d;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lo0/H$d;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, Lo0/H$d;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lo0/H$d;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
