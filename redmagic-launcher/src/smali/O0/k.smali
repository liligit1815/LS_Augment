.class public final synthetic LO0/k;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic g:LO0/r;

.field public final synthetic h:Landroid/view/View;

.field public final synthetic i:Lcom/android/launcher3/model/data/A;


# direct methods
.method public synthetic constructor <init>(LO0/r;Landroid/view/View;Lcom/android/launcher3/model/data/A;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LO0/k;->g:LO0/r;

    .line 5
    .line 6
    iput-object p2, p0, LO0/k;->h:Landroid/view/View;

    .line 7
    .line 8
    iput-object p3, p0, LO0/k;->i:Lcom/android/launcher3/model/data/A;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 1
    iget-object v0, p0, LO0/k;->g:LO0/r;

    .line 2
    .line 3
    iget-object v1, p0, LO0/k;->h:Landroid/view/View;

    .line 4
    .line 5
    iget-object p0, p0, LO0/k;->i:Lcom/android/launcher3/model/data/A;

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, LO0/r;->n(LO0/r;Landroid/view/View;Lcom/android/launcher3/model/data/A;Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
