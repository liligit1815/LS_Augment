.class Landroidx/fragment/app/y$a;
.super Ljava/lang/Object;
.source "FragmentLayoutInflaterFactory.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/fragment/app/y;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroidx/fragment/app/L;

.field final synthetic h:Landroidx/fragment/app/y;


# direct methods
.method constructor <init>(Landroidx/fragment/app/y;Landroidx/fragment/app/L;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/fragment/app/y$a;->h:Landroidx/fragment/app/y;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/fragment/app/y$a;->g:Landroidx/fragment/app/L;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Landroidx/fragment/app/y$a;->g:Landroidx/fragment/app/L;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/fragment/app/L;->k()Landroidx/fragment/app/n;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Landroidx/fragment/app/y$a;->g:Landroidx/fragment/app/L;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroidx/fragment/app/L;->m()V

    .line 10
    .line 11
    .line 12
    iget-object p1, p1, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Landroid/view/ViewGroup;

    .line 19
    .line 20
    iget-object p0, p0, Landroidx/fragment/app/y$a;->h:Landroidx/fragment/app/y;

    .line 21
    .line 22
    iget-object p0, p0, Landroidx/fragment/app/y;->g:Landroidx/fragment/app/F;

    .line 23
    .line 24
    invoke-static {p1, p0}, Landroidx/fragment/app/W;->r(Landroid/view/ViewGroup;Landroidx/fragment/app/F;)Landroidx/fragment/app/W;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Landroidx/fragment/app/W;->n()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method
