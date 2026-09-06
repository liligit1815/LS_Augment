.class Lcom/android/launcher3/taskbar/bubbles/u0$f;
.super Ljava/lang/Object;
.source "BubbleDragController.java"

# interfaces
.implements LN2/x$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/bubbles/u0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "f"
.end annotation


# instance fields
.field private a:LN2/h;

.field private b:LN2/r;

.field final synthetic c:Lcom/android/launcher3/taskbar/bubbles/u0;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/taskbar/bubbles/u0;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$f;->c:Lcom/android/launcher3/taskbar/bubbles/u0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    sget-object p1, LN2/h;->h:LN2/h;

    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$f;->a:LN2/h;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/taskbar/bubbles/u0;Lcom/android/launcher3/taskbar/bubbles/x0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/u0$f;-><init>(Lcom/android/launcher3/taskbar/bubbles/u0;)V

    return-void
.end method

.method static bridge synthetic d(Lcom/android/launcher3/taskbar/bubbles/u0$f;)LN2/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$f;->a:LN2/h;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public a(LN2/t;LN2/r;LN2/r;)V
    .locals 1

    .line 1
    iput-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/u0$f;->b:LN2/r;

    .line 2
    .line 3
    instance-of p2, p3, LN2/r$a$a;

    .line 4
    .line 5
    if-eqz p2, :cond_1

    .line 6
    .line 7
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/u0$f;->a:LN2/h;

    .line 8
    .line 9
    sget-object v0, LN2/h;->i:LN2/h;

    .line 10
    .line 11
    if-eq p2, v0, :cond_1

    .line 12
    .line 13
    instance-of p1, p1, LN2/t$a;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$f;->c:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/android/launcher3/taskbar/bubbles/u0;->c(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/t;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1, v0}, Lcom/android/launcher3/taskbar/bubbles/t;->S1(LN2/h;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$f;->a:LN2/h;

    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    instance-of p2, p3, LN2/r$a$b;

    .line 30
    .line 31
    if-eqz p2, :cond_3

    .line 32
    .line 33
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/u0$f;->a:LN2/h;

    .line 34
    .line 35
    sget-object p3, LN2/h;->j:LN2/h;

    .line 36
    .line 37
    if-eq p2, p3, :cond_3

    .line 38
    .line 39
    instance-of p1, p1, LN2/t$a;

    .line 40
    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$f;->c:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 44
    .line 45
    invoke-static {p1}, Lcom/android/launcher3/taskbar/bubbles/u0;->c(Lcom/android/launcher3/taskbar/bubbles/u0;)Lcom/android/launcher3/taskbar/bubbles/t;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1, p3}, Lcom/android/launcher3/taskbar/bubbles/t;->S1(LN2/h;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    iput-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/u0$f;->a:LN2/h;

    .line 53
    .line 54
    :cond_3
    return-void
.end method

.method public b(LN2/r;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$f;->b:LN2/r;

    .line 2
    .line 3
    instance-of v0, p1, LN2/r$a$a;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p1, LN2/h;->i:LN2/h;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$f;->a:LN2/h;

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    instance-of p1, p1, LN2/r$a$b;

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    sget-object p1, LN2/h;->j:LN2/h;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u0$f;->a:LN2/h;

    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public c(LN2/r;)V
    .locals 0

    .line 1
    return-void
.end method

.method e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u0$f;->b:LN2/r;

    .line 2
    .line 3
    instance-of p0, p0, LN2/r$e;

    .line 4
    .line 5
    return p0
.end method
