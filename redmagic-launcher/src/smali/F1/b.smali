.class public LF1/b;
.super Ljava/lang/Object;
.source "SplitActivityModel.java"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# static fields
.field public static final n:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "LF1/b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final g:Landroid/content/Context;

.field private h:Z

.field private i:Z

.field private j:Z

.field private k:Z

.field private l:Ljava/lang/String;

.field private m:Landroid/os/UserHandle;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, LF1/a;

    .line 4
    .line 5
    invoke-direct {v1}, LF1/a;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, LF1/b;->n:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, LF1/b;->h:Z

    .line 6
    .line 7
    iput-boolean v0, p0, LF1/b;->i:Z

    .line 8
    .line 9
    iput-boolean v0, p0, LF1/b;->j:Z

    .line 10
    .line 11
    iput-boolean v0, p0, LF1/b;->k:Z

    .line 12
    .line 13
    iput-object p1, p0, LF1/b;->g:Landroid/content/Context;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LF1/b;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Landroid/os/UserHandle;
    .locals 0

    .line 1
    iget-object p0, p0, LF1/b;->m:Landroid/os/UserHandle;

    .line 2
    .line 3
    return-object p0
.end method

.method public close()V
    .locals 0

    .line 1
    return-void
.end method

.method public d()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, LF1/b;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, LF1/b;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-boolean p0, p0, LF1/b;->i:Z

    .line 9
    .line 10
    return p0
.end method

.method public e()V
    .locals 4

    .line 1
    const-string v0, "init"

    .line 2
    .line 3
    const-string v1, "SplitActivityModel"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, LF1/b;->g:Landroid/content/Context;

    .line 9
    .line 10
    const-string v2, "config_use_split_activity"

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    invoke-static {v0, v2, v3}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-ne v0, v3, :cond_0

    .line 18
    .line 19
    move v0, v3

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    :goto_0
    iput-boolean v0, p0, LF1/b;->i:Z

    .line 23
    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v2, "mUseSplitActivity: "

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-boolean v2, p0, LF1/b;->i:Z

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    iput-boolean v3, p0, LF1/b;->h:Z

    .line 47
    .line 48
    return-void
.end method

.method public g(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "startSplitAppPkg = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "SplitActivityModel"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, LF1/b;->l:Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method

.method public j(Landroid/os/UserHandle;)V
    .locals 0

    .line 1
    iput-object p1, p0, LF1/b;->m:Landroid/os/UserHandle;

    .line 2
    .line 3
    return-void
.end method
