.class final LJ4/q;
.super Ljava/lang/Object;
.source "SafeCollector.kt"

# interfaces
.implements Ll4/d;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll4/d<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field public static final g:LJ4/q;

.field private static final h:Ll4/g;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LJ4/q;

    .line 2
    .line 3
    invoke-direct {v0}, LJ4/q;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LJ4/q;->g:LJ4/q;

    .line 7
    .line 8
    sget-object v0, Ll4/h;->g:Ll4/h;

    .line 9
    .line 10
    sput-object v0, LJ4/q;->h:Ll4/g;

    .line 11
    .line 12
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
.method public getContext()Ll4/g;
    .locals 0

    .line 1
    sget-object p0, LJ4/q;->h:Ll4/g;

    .line 2
    .line 3
    return-object p0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method
