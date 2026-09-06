.class final LC4/b;
.super Ljava/lang/Object;
.source "Sequences.kt"

# interfaces
.implements LC4/e;


# static fields
.field public static final a:LC4/b;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LC4/b;

    .line 2
    .line 3
    invoke-direct {v0}, LC4/b;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LC4/b;->a:LC4/b;

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
.method public iterator()Ljava/util/Iterator;
    .locals 0

    .line 1
    sget-object p0, Li4/x;->g:Li4/x;

    .line 2
    .line 3
    return-object p0
.end method
