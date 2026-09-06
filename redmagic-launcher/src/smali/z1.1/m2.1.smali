.class public Lz1/m2;
.super Ljava/lang/Object;
.source "ModelDelegate.java"


# instance fields
.field protected final a:Landroid/content/Context;

.field protected b:Lcom/android/launcher3/D3;

.field protected c:Lz1/m;

.field protected d:Lz1/y0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/m2;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Lz1/L0;Lz1/L0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Lcom/android/launcher3/D3;Lz1/m;Lz1/y0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lz1/m2;->b:Lcom/android/launcher3/D3;

    .line 2
    .line 3
    iput-object p2, p0, Lz1/m2;->c:Lz1/m;

    .line 4
    .line 5
    iput-object p3, p0, Lz1/m2;->d:Lz1/y0;

    .line 6
    .line 7
    return-void
.end method

.method public e(Lz1/L4;[Lz1/y0$b;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/L4;",
            "[",
            "Lz1/y0$b;",
            "Ljava/util/Map<",
            "LN1/e;",
            "Landroid/content/pm/ShortcutInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public f([Lz1/y0$b;)V
    .locals 0

    .line 1
    return-void
.end method

.method public g(Lz1/L4;[Lz1/y0$b;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/L4;",
            "[",
            "Lz1/y0$b;",
            "Ljava/util/Map<",
            "LN1/e;",
            "Landroid/content/pm/ShortcutInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public h(Lz1/G4;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/m2;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lz1/G4;->i(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/m2;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/util/J1;->g(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lz1/m2;->c:Lz1/m;

    .line 8
    .line 9
    invoke-virtual {v1}, Lz1/m;->q()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lz1/m2;->b:Lcom/android/launcher3/D3;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->a0()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public l()V
    .locals 0

    .line 1
    return-void
.end method
