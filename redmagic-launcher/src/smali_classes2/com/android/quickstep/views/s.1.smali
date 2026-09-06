.class public final synthetic Lcom/android/quickstep/views/s;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/views/IconView;

.field public final synthetic h:Landroid/view/View$OnLongClickListener;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/IconView;Landroid/view/View$OnLongClickListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/s;->g:Lcom/android/quickstep/views/IconView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/views/s;->h:Landroid/view/View$OnLongClickListener;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/s;->g:Lcom/android/quickstep/views/IconView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/s;->h:Landroid/view/View$OnLongClickListener;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/views/IconView;->a(Lcom/android/quickstep/views/IconView;Landroid/view/View$OnLongClickListener;Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
