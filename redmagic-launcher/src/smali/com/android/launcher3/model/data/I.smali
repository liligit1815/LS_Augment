.class public Lcom/android/launcher3/model/data/I;
.super Lcom/android/launcher3/model/data/z;
.source "WorkspaceItemInfo.java"


# instance fields
.field public k:Landroid/content/Intent;

.field public l:Ljava/lang/CharSequence;

.field public m:I

.field private n:[Ljava/lang/String;

.field public o:I

.field private p:Landroid/content/pm/ShortcutInfo;

.field public q:Landroid/content/Intent$ShortcutIconResource;

.field public r:I

.field private s:I

.field private t:Ljava/lang/Boolean;

.field public u:Landroid/graphics/Bitmap;

.field public v:Z

.field public w:Z

.field private x:I

.field private y:I

.field private z:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/model/data/z;-><init>()V

    .line 2
    sget-object v0, Lcom/android/launcher3/N5;->c:[Ljava/lang/String;

    iput-object v0, p0, Lcom/android/launcher3/model/data/I;->n:[Ljava/lang/String;

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lcom/android/launcher3/model/data/I;->p:Landroid/content/pm/ShortcutInfo;

    const/4 v0, 0x0

    .line 4
    iput v0, p0, Lcom/android/launcher3/model/data/I;->r:I

    .line 5
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v1, p0, Lcom/android/launcher3/model/data/I;->t:Ljava/lang/Boolean;

    .line 6
    iput-boolean v0, p0, Lcom/android/launcher3/model/data/I;->v:Z

    .line 7
    iput-boolean v0, p0, Lcom/android/launcher3/model/data/I;->w:Z

    .line 8
    iput v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    return-void
.end method

.method public constructor <init>(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V
    .locals 2

    .line 29
    invoke-direct {p0}, Lcom/android/launcher3/model/data/z;-><init>()V

    .line 30
    sget-object v0, Lcom/android/launcher3/N5;->c:[Ljava/lang/String;

    iput-object v0, p0, Lcom/android/launcher3/model/data/I;->n:[Ljava/lang/String;

    const/4 v0, 0x0

    .line 31
    iput-object v0, p0, Lcom/android/launcher3/model/data/I;->p:Landroid/content/pm/ShortcutInfo;

    const/4 v0, 0x0

    .line 32
    iput v0, p0, Lcom/android/launcher3/model/data/I;->r:I

    .line 33
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v1, p0, Lcom/android/launcher3/model/data/I;->t:Ljava/lang/Boolean;

    .line 34
    iput-boolean v0, p0, Lcom/android/launcher3/model/data/I;->v:Z

    .line 35
    iput-boolean v0, p0, Lcom/android/launcher3/model/data/I;->w:Z

    .line 36
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getUserHandle()Landroid/os/UserHandle;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    const/4 v0, 0x6

    .line 37
    iput v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 38
    const-string v0, "isCustomApp"

    invoke-static {p1, v0}, Lcom/android/launcher3/H5;->j0(Landroid/content/pm/ShortcutInfo;Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/launcher3/model/data/I;->w:Z

    .line 39
    invoke-static {}, Lcom/android/launcher3/y0;->x0()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 40
    sget-object v0, LD1/t;->g:Lcom/android/launcher3/util/I;

    invoke-virtual {v0, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LD1/t;

    iget-object v1, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    invoke-virtual {v0, v1}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher3/util/N2;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 41
    iget v0, p0, Lcom/android/launcher3/model/data/z;->h:I

    or-int/lit16 v0, v0, 0x2000

    iput v0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 42
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/model/data/I;->i0(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/model/data/I;)V
    .locals 2

    .line 9
    invoke-direct {p0, p1}, Lcom/android/launcher3/model/data/z;-><init>(Lcom/android/launcher3/model/data/z;)V

    .line 10
    sget-object v0, Lcom/android/launcher3/N5;->c:[Ljava/lang/String;

    iput-object v0, p0, Lcom/android/launcher3/model/data/I;->n:[Ljava/lang/String;

    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/android/launcher3/model/data/I;->p:Landroid/content/pm/ShortcutInfo;

    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/android/launcher3/model/data/I;->r:I

    .line 13
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v1, p0, Lcom/android/launcher3/model/data/I;->t:Ljava/lang/Boolean;

    .line 14
    iput-boolean v0, p0, Lcom/android/launcher3/model/data/I;->v:Z

    .line 15
    iput-boolean v0, p0, Lcom/android/launcher3/model/data/I;->w:Z

    .line 16
    iget-object v0, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 17
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p1, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    iput-object v0, p0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 18
    iget v0, p1, Lcom/android/launcher3/model/data/I;->m:I

    iput v0, p0, Lcom/android/launcher3/model/data/I;->m:I

    .line 19
    iget-object p1, p1, Lcom/android/launcher3/model/data/I;->n:[Ljava/lang/String;

    invoke-virtual {p1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    iput-object p1, p0, Lcom/android/launcher3/model/data/I;->n:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/model/data/d;)V
    .locals 2

    .line 20
    invoke-direct {p0, p1}, Lcom/android/launcher3/model/data/z;-><init>(Lcom/android/launcher3/model/data/z;)V

    .line 21
    sget-object v0, Lcom/android/launcher3/N5;->c:[Ljava/lang/String;

    iput-object v0, p0, Lcom/android/launcher3/model/data/I;->n:[Ljava/lang/String;

    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/android/launcher3/model/data/I;->p:Landroid/content/pm/ShortcutInfo;

    const/4 v0, 0x0

    .line 23
    iput v0, p0, Lcom/android/launcher3/model/data/I;->r:I

    .line 24
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v1, p0, Lcom/android/launcher3/model/data/I;->t:Ljava/lang/Boolean;

    .line 25
    iput-boolean v0, p0, Lcom/android/launcher3/model/data/I;->v:Z

    .line 26
    iput-boolean v0, p0, Lcom/android/launcher3/model/data/I;->w:Z

    .line 27
    iget-object v0, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    invoke-static {v0}, Lcom/android/launcher3/N5;->g0(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 28
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p1}, Lcom/android/launcher3/model/data/d;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    iput-object v0, p0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    return-void
.end method

.method public static synthetic N(I)[Ljava/lang/String;
    .locals 0

    .line 1
    new-array p0, p0, [Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public O()Lcom/android/launcher3/model/data/I;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/model/data/I;-><init>(Lcom/android/launcher3/model/data/I;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public P()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/I;->x:I

    .line 2
    .line 3
    return p0
.end method

.method public Q()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/I;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string v0, "shortcut_id"

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public R()Landroid/content/pm/ShortcutInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/I;->p:Landroid/content/pm/ShortcutInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public S()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/I;->s:I

    .line 2
    .line 3
    return p0
.end method

.method public T()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/I;->z:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public U()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/I;->t:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public V()[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/I;->n:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public W()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/I;->r:I

    .line 2
    .line 3
    return p0
.end method

.method public X()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/I;->y:I

    .line 2
    .line 3
    return p0
.end method

.method public Y()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/I;->b0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/16 v0, 0x8

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/android/launcher3/model/data/I;->Z(I)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public Z(I)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/I;->m:I

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public a0()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 2
    .line 3
    and-int/lit16 p0, p0, 0x1000

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final b0()Z
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/model/data/I;->Z(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/z;->A()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 18
    return p0
.end method

.method public c0(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/model/data/I;->x:I

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/I;->O()Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d0(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/model/data/I;->s:I

    .line 2
    .line 3
    if-ge p1, v0, :cond_1

    .line 4
    .line 5
    const/16 v0, -0x64

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    iput p1, p0, Lcom/android/launcher3/model/data/I;->s:I

    .line 12
    .line 13
    return-void
.end method

.method protected dumpProperties()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/android/launcher3/model/data/z;->dumpProperties()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " status="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/android/launcher3/model/data/I;->m:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, " state="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget p0, p0, Lcom/android/launcher3/model/data/I;->r:I

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public e0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/model/data/I;->z:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public f0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/model/data/I;->t:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-void
.end method

.method public g0(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/model/data/I;->r:I

    .line 2
    .line 3
    return-void
.end method

.method public getIntent()Landroid/content/Intent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTargetComponent()Landroid/content/ComponentName;
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget v1, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eq v1, v2, :cond_0

    .line 11
    .line 12
    const/4 v2, 0x6

    .line 13
    if-eq v1, v2, :cond_0

    .line 14
    .line 15
    const/16 v1, 0xb

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Lcom/android/launcher3/model/data/I;->Z(I)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-nez p0, :cond_1

    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return-object p0

    .line 33
    :cond_1
    new-instance v0, Landroid/content/ComponentName;

    .line 34
    .line 35
    const-string v1, "."

    .line 36
    .line 37
    invoke-direct {v0, p0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_2
    return-object v0
.end method

.method public h0(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/model/data/I;->y:I

    .line 2
    .line 3
    return-void
.end method

.method public i0(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V
    .locals 4

    .line 1
    const-string v0, "ItemInfoDebug"

    .line 2
    .line 3
    invoke-static {}, LN2/g;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/model/data/I;->p:Landroid/content/pm/ShortcutInfo;

    .line 10
    .line 11
    :cond_0
    invoke-static {p1}, LN1/e;->g(Landroid/content/pm/ShortcutInfo;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, p0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getExtras()Landroid/os/PersistableBundle;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getExtras()Landroid/os/PersistableBundle;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "shortcut_component_primary"

    .line 30
    .line 31
    invoke-virtual {v2, v3}, Landroid/os/PersistableBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getExtras()Landroid/os/PersistableBundle;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    const-string v3, "shortcut_user_primary"

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Landroid/os/PersistableBundle;->getInt(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getExtras()Landroid/os/PersistableBundle;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    const-string v3, "shortcut_component_secondary"

    .line 60
    .line 61
    invoke-virtual {v2, v3}, Landroid/os/PersistableBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getExtras()Landroid/os/PersistableBundle;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    const-string v3, "shortcut_user_secondary"

    .line 75
    .line 76
    invoke-virtual {v2, v3}, Landroid/os/PersistableBundle;->getInt(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 81
    .line 82
    .line 83
    :cond_1
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getShortLabel()Ljava/lang/CharSequence;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iput-object v1, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 88
    .line 89
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getLongLabel()Ljava/lang/CharSequence;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_2

    .line 98
    .line 99
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getShortLabel()Ljava/lang/CharSequence;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    :cond_2
    :try_start_0
    invoke-virtual {p2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    iget-object v3, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 108
    .line 109
    invoke-virtual {v2, v1, v3}, Landroid/content/pm/PackageManager;->getUserBadgedLabel(Ljava/lang/CharSequence;Landroid/os/UserHandle;)Ljava/lang/CharSequence;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    iput-object v1, p0, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :catch_0
    move-exception v1

    .line 117
    const/4 v2, 0x0

    .line 118
    iput-object v2, p0, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 119
    .line 120
    const-string v2, "Failed to get content description"

    .line 121
    .line 122
    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 123
    .line 124
    .line 125
    :goto_0
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->isEnabled()Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-eqz v1, :cond_3

    .line 130
    .line 131
    iget v0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 132
    .line 133
    and-int/lit8 v0, v0, -0x11

    .line 134
    .line 135
    iput v0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 141
    .line 142
    .line 143
    const-string v2, "updateFromDeepShortcutInfo: Updated shortcut has been disabled.  package="

    .line 144
    .line 145
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getPackage()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    const-string v2, " disabledReason="

    .line 156
    .line 157
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getDisabledReason()I

    .line 161
    .line 162
    .line 163
    move-result v2

    .line 164
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    .line 173
    .line 174
    iget v1, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 175
    .line 176
    or-int/lit8 v1, v1, 0x10

    .line 177
    .line 178
    iput v1, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 179
    .line 180
    new-instance v1, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 183
    .line 184
    .line 185
    const-string v2, "updateFromDeepShortcutInfo: FLAG_DISABLED_BY_PUBLISHER: "

    .line 186
    .line 187
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->toInsecureString()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    .line 203
    .line 204
    :goto_1
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getDisabledReason()I

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    const/16 v1, 0x64

    .line 209
    .line 210
    if-ne v0, v1, :cond_4

    .line 211
    .line 212
    iget v0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 213
    .line 214
    or-int/lit16 v0, v0, 0x1000

    .line 215
    .line 216
    iput v0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 217
    .line 218
    goto :goto_2

    .line 219
    :cond_4
    iget v0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 220
    .line 221
    and-int/lit16 v0, v0, -0x1001

    .line 222
    .line 223
    iput v0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 224
    .line 225
    :goto_2
    sget-object v0, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    .line 226
    .line 227
    invoke-virtual {v0, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object p2

    .line 231
    check-cast p2, Lcom/android/launcher3/util/f;

    .line 232
    .line 233
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/f;->g(Landroid/content/pm/ShortcutInfo;)[Landroid/app/Person;

    .line 234
    .line 235
    .line 236
    move-result-object p2

    .line 237
    array-length v0, p2

    .line 238
    if-nez v0, :cond_5

    .line 239
    .line 240
    sget-object p2, Lcom/android/launcher3/N5;->c:[Ljava/lang/String;

    .line 241
    .line 242
    goto :goto_3

    .line 243
    :cond_5
    invoke-static {p2}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 244
    .line 245
    .line 246
    move-result-object p2

    .line 247
    new-instance v0, Lcom/android/launcher3/model/data/G;

    .line 248
    .line 249
    invoke-direct {v0}, Lcom/android/launcher3/model/data/G;-><init>()V

    .line 250
    .line 251
    .line 252
    invoke-interface {p2, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 253
    .line 254
    .line 255
    move-result-object p2

    .line 256
    invoke-interface {p2}, Ljava/util/stream/Stream;->sorted()Ljava/util/stream/Stream;

    .line 257
    .line 258
    .line 259
    move-result-object p2

    .line 260
    new-instance v0, Lcom/android/launcher3/model/data/H;

    .line 261
    .line 262
    invoke-direct {v0}, Lcom/android/launcher3/model/data/H;-><init>()V

    .line 263
    .line 264
    .line 265
    invoke-interface {p2, v0}, Ljava/util/stream/Stream;->toArray(Ljava/util/function/IntFunction;)[Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object p2

    .line 269
    check-cast p2, [Ljava/lang/String;

    .line 270
    .line 271
    :goto_3
    iput-object p2, p0, Lcom/android/launcher3/model/data/I;->n:[Ljava/lang/String;

    .line 272
    .line 273
    const-string p2, "isCustomApp"

    .line 274
    .line 275
    iget-boolean v0, p0, Lcom/android/launcher3/model/data/I;->w:Z

    .line 276
    .line 277
    invoke-static {p1, p2, v0}, Lcom/android/launcher3/H5;->a1(Landroid/content/pm/ShortcutInfo;Ljava/lang/String;Z)V

    .line 278
    .line 279
    .line 280
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/z;->C()Z

    .line 281
    .line 282
    .line 283
    move-result p2

    .line 284
    const-string v0, "needShowBadge"

    .line 285
    .line 286
    invoke-static {p1, v0}, Lcom/android/launcher3/H5;->j0(Landroid/content/pm/ShortcutInfo;Ljava/lang/String;)Z

    .line 287
    .line 288
    .line 289
    move-result v1

    .line 290
    if-eq p2, v1, :cond_6

    .line 291
    .line 292
    const/4 p2, 0x0

    .line 293
    invoke-static {p1, v0, p2}, Lcom/android/launcher3/H5;->a1(Landroid/content/pm/ShortcutInfo;Ljava/lang/String;Z)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {p0, p2}, Lcom/android/launcher3/model/data/z;->H(Z)V

    .line 297
    .line 298
    .line 299
    :cond_6
    return-void
.end method

.method public onAddToDatabase(Lcom/android/launcher3/util/G;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/model/data/y;->onAddToDatabase(Lcom/android/launcher3/util/G;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "title"

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/util/G;->g(Ljava/lang/String;Ljava/lang/CharSequence;)Lcom/android/launcher3/util/G;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "intent"

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/I;->getIntent()Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/util/G;->d(Ljava/lang/String;Landroid/content/Intent;)Lcom/android/launcher3/util/G;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget v1, p0, Lcom/android/launcher3/model/data/I;->o:I

    .line 23
    .line 24
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "options"

    .line 29
    .line 30
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget v1, p0, Lcom/android/launcher3/model/data/I;->m:I

    .line 35
    .line 36
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v3, "restored"

    .line 41
    .line 42
    invoke-virtual {v0, v3, v1}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/z;->C()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    const/16 v3, 0x10

    .line 51
    .line 52
    const/4 v4, 0x0

    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    move v1, v4

    .line 56
    goto :goto_0

    .line 57
    :cond_0
    move v1, v3

    .line 58
    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->isShortcutAddFromOtherApp()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/z;->C()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    move v3, v4

    .line 78
    :cond_1
    or-int/lit16 v0, v3, 0x100

    .line 79
    .line 80
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p1, v2, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 85
    .line 86
    .line 87
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/z;->x()Lt1/g;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Lt1/g;->e()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-nez v0, :cond_5

    .line 96
    .line 97
    iget-object v0, p0, Lcom/android/launcher3/model/data/I;->u:Landroid/graphics/Bitmap;

    .line 98
    .line 99
    if-eqz v0, :cond_3

    .line 100
    .line 101
    invoke-static {v0}, Ls1/d;->e(Landroid/graphics/Bitmap;)Ls1/d;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 106
    .line 107
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/util/G;->v(Ls1/d;Landroid/os/UserHandle;)Lcom/android/launcher3/util/G;

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_3
    iget-boolean v0, p0, Lcom/android/launcher3/model/data/I;->v:Z

    .line 112
    .line 113
    if-eqz v0, :cond_4

    .line 114
    .line 115
    new-instance p1, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 118
    .line 119
    .line 120
    const-string v0, "onAddToDatabase--isRestoredAppIconBitmap: true--"

    .line 121
    .line 122
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 126
    .line 127
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    const-string p1, "ShortCutInfo"

    .line 135
    .line 136
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 141
    .line 142
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 143
    .line 144
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/util/G;->v(Ls1/d;Landroid/os/UserHandle;)Lcom/android/launcher3/util/G;

    .line 145
    .line 146
    .line 147
    :cond_5
    return-void
.end method

.method public bridge synthetic v()Lcom/android/launcher3/model/data/z;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/I;->O()Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
