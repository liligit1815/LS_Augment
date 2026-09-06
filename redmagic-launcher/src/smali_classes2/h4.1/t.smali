.class public final Lh4/t;
.super Ljava/lang/Object;
.source "Unit.kt"


# static fields
.field public static final a:Lh4/t;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lh4/t;

    .line 2
    .line 3
    invoke-direct {v0}, Lh4/t;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lh4/t;->a:Lh4/t;

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
.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "kotlin.Unit"

    .line 2
    .line 3
    return-object p0
.end method
