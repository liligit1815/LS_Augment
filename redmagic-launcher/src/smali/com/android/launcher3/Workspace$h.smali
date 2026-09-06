.class Lcom/android/launcher3/Workspace$h;
.super Ljava/lang/Object;
.source "Workspace.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/Workspace;->u2([ILcom/android/launcher3/CellLayout;Lcom/android/launcher3/n0$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/W4;

.field final synthetic h:I

.field final synthetic i:I

.field final synthetic j:Lcom/android/launcher3/model/data/y;

.field final synthetic k:Lcom/android/launcher3/n0$a;

.field final synthetic l:Lcom/android/launcher3/Workspace;


# direct methods
.method constructor <init>(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/W4;IILcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/Workspace$h;->l:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/Workspace$h;->g:Lcom/android/launcher3/W4;

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/Workspace$h;->h:I

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/Workspace$h;->i:I

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/Workspace$h;->j:Lcom/android/launcher3/model/data/y;

    .line 10
    .line 11
    iput-object p6, p0, Lcom/android/launcher3/Workspace$h;->k:Lcom/android/launcher3/n0$a;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace$h;->l:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->T0()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/Workspace$h;->l:Lcom/android/launcher3/Workspace;

    .line 7
    .line 8
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    iget-object v2, p0, Lcom/android/launcher3/Workspace$h;->g:Lcom/android/launcher3/W4;

    .line 11
    .line 12
    iget v3, p0, Lcom/android/launcher3/Workspace$h;->h:I

    .line 13
    .line 14
    iget v4, p0, Lcom/android/launcher3/Workspace$h;->i:I

    .line 15
    .line 16
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/Workspace$h;->j:Lcom/android/launcher3/model/data/y;

    .line 19
    .line 20
    iget v6, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 21
    .line 22
    iget v7, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 23
    .line 24
    invoke-virtual/range {v1 .. v7}, Lcom/android/launcher3/C2;->Y0(Lcom/android/launcher3/W4;II[III)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/Workspace$h;->l:Lcom/android/launcher3/Workspace;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/android/launcher3/Workspace;->w0(Lcom/android/launcher3/Workspace;)Lcom/android/launcher3/logging/StatsLogManager;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Lcom/android/launcher3/Workspace$h;->k:Lcom/android/launcher3/n0$a;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 40
    .line 41
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object p0, p0, Lcom/android/launcher3/Workspace$h;->k:Lcom/android/launcher3/n0$a;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/android/launcher3/n0$a;->n:Lcom/android/launcher3/logging/d;

    .line 48
    .line 49
    invoke-interface {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->p:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 54
    .line 55
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
