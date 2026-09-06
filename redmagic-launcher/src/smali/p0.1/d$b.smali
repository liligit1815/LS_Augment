.class public final Lp0/d$b;
.super Ljava/lang/Object;
.source "HardwareFoldingFeature.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lp0/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lp0/d$b$a;
    }
.end annotation


# static fields
.field public static final b:Lp0/d$b$a;

.field private static final c:Lp0/d$b;

.field private static final d:Lp0/d$b;


# instance fields
.field private final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lp0/d$b$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lp0/d$b$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lp0/d$b;->b:Lp0/d$b$a;

    .line 8
    .line 9
    new-instance v0, Lp0/d$b;

    .line 10
    .line 11
    const-string v1, "FOLD"

    .line 12
    .line 13
    invoke-direct {v0, v1}, Lp0/d$b;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sput-object v0, Lp0/d$b;->c:Lp0/d$b;

    .line 17
    .line 18
    new-instance v0, Lp0/d$b;

    .line 19
    .line 20
    const-string v1, "HINGE"

    .line 21
    .line 22
    invoke-direct {v0, v1}, Lp0/d$b;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lp0/d$b;->d:Lp0/d$b;

    .line 26
    .line 27
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lp0/d$b;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static final synthetic a()Lp0/d$b;
    .locals 1

    .line 1
    sget-object v0, Lp0/d$b;->c:Lp0/d$b;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic b()Lp0/d$b;
    .locals 1

    .line 1
    sget-object v0, Lp0/d$b;->d:Lp0/d$b;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lp0/d$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
