.class public final synthetic Landroidx/fragment/app/h;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Landroidx/fragment/app/Q;

.field public final synthetic h:Landroid/view/View;

.field public final synthetic i:Landroid/graphics/Rect;


# direct methods
.method public synthetic constructor <init>(Landroidx/fragment/app/Q;Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/fragment/app/h;->g:Landroidx/fragment/app/Q;

    .line 5
    .line 6
    iput-object p2, p0, Landroidx/fragment/app/h;->h:Landroid/view/View;

    .line 7
    .line 8
    iput-object p3, p0, Landroidx/fragment/app/h;->i:Landroid/graphics/Rect;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/h;->g:Landroidx/fragment/app/Q;

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/fragment/app/h;->h:Landroid/view/View;

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/fragment/app/h;->i:Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Landroidx/fragment/app/k;->C(Landroidx/fragment/app/Q;Landroid/view/View;Landroid/graphics/Rect;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
