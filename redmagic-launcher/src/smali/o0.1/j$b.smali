.class public final Lo0/j$b;
.super Ljava/lang/Object;
.source "EmbeddingAnimationBackground.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lo0/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lo0/j$b;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(I)Lo0/j;
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0xff

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    sget-object p0, Lo0/j;->b:Lo0/j;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Lo0/j$b;->b(I)Lo0/j$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final b(I)Lo0/j$a;
    .locals 0

    .line 1
    new-instance p0, Lo0/j$a;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lo0/j$a;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
