.class public final Ln0/d;
.super Ljava/lang/Object;
.source "BuildConfig.kt"


# static fields
.field public static final a:Ln0/d;

.field private static final b:Ln0/l;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ln0/d;

    .line 2
    .line 3
    invoke-direct {v0}, Ln0/d;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ln0/d;->a:Ln0/d;

    .line 7
    .line 8
    sget-object v0, Ln0/l;->i:Ln0/l;

    .line 9
    .line 10
    sput-object v0, Ln0/d;->b:Ln0/l;

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
.method public final a()Ln0/l;
    .locals 0

    .line 1
    sget-object p0, Ln0/d;->b:Ln0/l;

    .line 2
    .line 3
    return-object p0
.end method
