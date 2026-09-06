.class final Lp0/b;
.super Ljava/lang/Object;
.source "WindowInfoTracker.kt"

# interfaces
.implements Lp0/g;


# static fields
.field public static final a:Lp0/b;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lp0/b;

    .line 2
    .line 3
    invoke-direct {v0}, Lp0/b;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lp0/b;->a:Lp0/b;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lp0/f;)Lp0/f;
    .locals 0

    .line 1
    const-string p0, "tracker"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method
