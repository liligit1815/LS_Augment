.class public final synthetic LR2/c;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic g:LR2/b$b;

.field public final synthetic h:I


# direct methods
.method public synthetic constructor <init>(LR2/b$b;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LR2/c;->g:LR2/b$b;

    .line 5
    .line 6
    iput p2, p0, LR2/c;->h:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, LR2/c;->g:LR2/b$b;

    .line 2
    .line 3
    iget p0, p0, LR2/c;->h:I

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, LR2/b$b;->a(LR2/b$b;ILandroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
