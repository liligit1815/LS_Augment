.class Lcom/android/launcher3/Workspace$i;
.super Ljava/lang/Object;
.source "Workspace.java"

# interfaces
.implements Lx1/h0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/Workspace;->u2([ILcom/android/launcher3/CellLayout;Lcom/android/launcher3/n0$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private a:Z

.field final synthetic b:Lcom/android/launcher3/model/data/y;

.field final synthetic c:Lcom/android/launcher3/CellLayout;

.field final synthetic d:Lcom/android/launcher3/dragndrop/v;

.field final synthetic e:Ljava/lang/Runnable;

.field final synthetic f:I

.field final synthetic g:Landroid/appwidget/AppWidgetHostView;

.field final synthetic h:Lcom/android/launcher3/Workspace;


# direct methods
.method constructor <init>(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/dragndrop/v;Ljava/lang/Runnable;ILandroid/appwidget/AppWidgetHostView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/Workspace$i;->h:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/Workspace$i;->b:Lcom/android/launcher3/model/data/y;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/Workspace$i;->c:Lcom/android/launcher3/CellLayout;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/Workspace$i;->d:Lcom/android/launcher3/dragndrop/v;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/Workspace$i;->e:Ljava/lang/Runnable;

    .line 10
    .line 11
    iput p6, p0, Lcom/android/launcher3/Workspace$i;->f:I

    .line 12
    .line 13
    iput-object p7, p0, Lcom/android/launcher3/Workspace$i;->g:Landroid/appwidget/AppWidgetHostView;

    .line 14
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Lcom/android/launcher3/Workspace$i;->a:Z

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/Workspace$i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Workspace$i;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic d()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace$i;->h:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/android/launcher3/q4$a;->l:Lcom/android/launcher3/q4$a;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/Workspace$i;->h:Lcom/android/launcher3/Workspace;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->A0()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public b()V
    .locals 9

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/Workspace$i;->a:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/android/launcher3/Workspace$i;->h:Lcom/android/launcher3/Workspace;

    .line 5
    .line 6
    iget-object v2, p0, Lcom/android/launcher3/Workspace$i;->b:Lcom/android/launcher3/model/data/y;

    .line 7
    .line 8
    iget-object v3, p0, Lcom/android/launcher3/Workspace$i;->c:Lcom/android/launcher3/CellLayout;

    .line 9
    .line 10
    iget-object v4, p0, Lcom/android/launcher3/Workspace$i;->d:Lcom/android/launcher3/dragndrop/v;

    .line 11
    .line 12
    iget-object v5, p0, Lcom/android/launcher3/Workspace$i;->e:Ljava/lang/Runnable;

    .line 13
    .line 14
    iget v6, p0, Lcom/android/launcher3/Workspace$i;->f:I

    .line 15
    .line 16
    iget-object v7, p0, Lcom/android/launcher3/Workspace$i;->g:Landroid/appwidget/AppWidgetHostView;

    .line 17
    .line 18
    const/4 v8, 0x1

    .line 19
    invoke-virtual/range {v1 .. v8}, Lcom/android/launcher3/Workspace;->D0(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/dragndrop/v;Ljava/lang/Runnable;ILandroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onDismiss()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/Workspace$i;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/Workspace$i;->c:Lcom/android/launcher3/CellLayout;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/Workspace$i;->h:Lcom/android/launcher3/Workspace;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget-object v1, Lcom/android/launcher3/q4$a;->l:Lcom/android/launcher3/q4$a;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/Workspace$i;->h:Lcom/android/launcher3/Workspace;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->A0()V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/Workspace$i;->h:Lcom/android/launcher3/Workspace;

    .line 41
    .line 42
    new-instance v1, Lcom/android/launcher3/K6;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Lcom/android/launcher3/K6;-><init>(Lcom/android/launcher3/Workspace$i;)V

    .line 45
    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-virtual {v0, v2, v2, v1}, Lcom/android/launcher3/Workspace;->G2(IZLjava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/Workspace$i;->d:Lcom/android/launcher3/dragndrop/v;

    .line 52
    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    iget-object p0, p0, Lcom/android/launcher3/Workspace$i;->h:Lcom/android/launcher3/Workspace;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Lcom/android/launcher3/dragndrop/j;->L(Lcom/android/launcher3/dragndrop/v;)V

    .line 60
    .line 61
    .line 62
    :cond_3
    :goto_1
    return-void
.end method
