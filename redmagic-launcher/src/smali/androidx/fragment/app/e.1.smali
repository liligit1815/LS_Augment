.class public final synthetic Landroidx/fragment/app/e;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements LF/d$a;


# instance fields
.field public final synthetic a:Landroid/animation/Animator;

.field public final synthetic b:Landroidx/fragment/app/W$c;


# direct methods
.method public synthetic constructor <init>(Landroid/animation/Animator;Landroidx/fragment/app/W$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/fragment/app/e;->a:Landroid/animation/Animator;

    .line 5
    .line 6
    iput-object p2, p0, Landroidx/fragment/app/e;->b:Landroidx/fragment/app/W$c;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onCancel()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/e;->a:Landroid/animation/Animator;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/fragment/app/e;->b:Landroidx/fragment/app/W$c;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroidx/fragment/app/k;->y(Landroid/animation/Animator;Landroidx/fragment/app/W$c;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
