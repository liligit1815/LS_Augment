.class public final Lr0/a$a;
.super Ljava/lang/Object;
.source "ExtensionWindowBackend.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lr0/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
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
    invoke-direct {p0}, Lr0/a$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroidx/window/extensions/layout/WindowLayoutComponent;Ln0/e;)Lq0/a;
    .locals 1

    .line 1
    const-string p0, "component"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "adapter"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Ln0/f;->a:Ln0/f;

    .line 12
    .line 13
    invoke-virtual {p0}, Ln0/f;->a()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 v0, 0x2

    .line 18
    if-lt p0, v0, :cond_0

    .line 19
    .line 20
    new-instance p0, Lr0/e;

    .line 21
    .line 22
    invoke-direct {p0, p1}, Lr0/e;-><init>(Landroidx/window/extensions/layout/WindowLayoutComponent;)V

    .line 23
    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    const/4 v0, 0x1

    .line 27
    if-ne p0, v0, :cond_1

    .line 28
    .line 29
    new-instance p0, Lr0/d;

    .line 30
    .line 31
    invoke-direct {p0, p1, p2}, Lr0/d;-><init>(Landroidx/window/extensions/layout/WindowLayoutComponent;Ln0/e;)V

    .line 32
    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_1
    new-instance p0, Lr0/c;

    .line 36
    .line 37
    invoke-direct {p0}, Lr0/c;-><init>()V

    .line 38
    .line 39
    .line 40
    return-object p0
.end method
