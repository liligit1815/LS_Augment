.class public final Lz1/i0;
.super Ljava/lang/Object;
.source "BaseLauncherBinder_Factory.java"


# instance fields
.field private final a:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/F1;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/D3;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lz1/y0;",
            ">;"
        }
    .end annotation
.end field

.field private final e:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lz1/m;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/F1;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/D3;",
            ">;",
            "Lg4/a<",
            "Lz1/y0;",
            ">;",
            "Lg4/a<",
            "Lz1/m;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/i0;->a:Lg4/a;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/i0;->b:Lg4/a;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/i0;->c:Lg4/a;

    .line 9
    .line 10
    iput-object p4, p0, Lz1/i0;->d:Lg4/a;

    .line 11
    .line 12
    iput-object p5, p0, Lz1/i0;->e:Lg4/a;

    .line 13
    .line 14
    return-void
.end method

.method public static a(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)Lz1/i0;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/F1;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/D3;",
            ">;",
            "Lg4/a<",
            "Lz1/y0;",
            ">;",
            "Lg4/a<",
            "Lz1/m;",
            ">;)",
            "Lz1/i0;"
        }
    .end annotation

    .line 1
    new-instance v0, Lz1/i0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Lz1/i0;-><init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static c(Landroid/content/Context;Lcom/android/launcher3/F1;Lcom/android/launcher3/D3;Lz1/y0;Lz1/m;[Lz1/y0$b;)Lz1/O;
    .locals 7

    .line 1
    new-instance v0, Lz1/O;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    move-object v6, p5

    .line 9
    invoke-direct/range {v0 .. v6}, Lz1/O;-><init>(Landroid/content/Context;Lcom/android/launcher3/F1;Lcom/android/launcher3/D3;Lz1/y0;Lz1/m;[Lz1/y0$b;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method


# virtual methods
.method public b([Lz1/y0$b;)Lz1/O;
    .locals 7

    .line 1
    iget-object v0, p0, Lz1/i0;->a:Lg4/a;

    .line 2
    .line 3
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v1, v0

    .line 8
    check-cast v1, Landroid/content/Context;

    .line 9
    .line 10
    iget-object v0, p0, Lz1/i0;->b:Lg4/a;

    .line 11
    .line 12
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    move-object v2, v0

    .line 17
    check-cast v2, Lcom/android/launcher3/F1;

    .line 18
    .line 19
    iget-object v0, p0, Lz1/i0;->c:Lg4/a;

    .line 20
    .line 21
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v3, v0

    .line 26
    check-cast v3, Lcom/android/launcher3/D3;

    .line 27
    .line 28
    iget-object v0, p0, Lz1/i0;->d:Lg4/a;

    .line 29
    .line 30
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    move-object v4, v0

    .line 35
    check-cast v4, Lz1/y0;

    .line 36
    .line 37
    iget-object p0, p0, Lz1/i0;->e:Lg4/a;

    .line 38
    .line 39
    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    move-object v5, p0

    .line 44
    check-cast v5, Lz1/m;

    .line 45
    .line 46
    move-object v6, p1

    .line 47
    invoke-static/range {v1 .. v6}, Lz1/i0;->c(Landroid/content/Context;Lcom/android/launcher3/F1;Lcom/android/launcher3/D3;Lz1/y0;Lz1/m;[Lz1/y0$b;)Lz1/O;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method
