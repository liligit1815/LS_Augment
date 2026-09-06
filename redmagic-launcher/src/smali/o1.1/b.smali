.class public final synthetic Lo1/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/helper/a;

.field public final synthetic h:I

.field public final synthetic i:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/helper/a;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lo1/b;->g:Lcom/android/launcher3/helper/a;

    .line 5
    .line 6
    iput p2, p0, Lo1/b;->h:I

    .line 7
    .line 8
    iput-object p3, p0, Lo1/b;->i:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lo1/b;->g:Lcom/android/launcher3/helper/a;

    .line 2
    .line 3
    iget v1, p0, Lo1/b;->h:I

    .line 4
    .line 5
    iget-object p0, p0, Lo1/b;->i:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, Lcom/android/launcher3/helper/a;->b(Lcom/android/launcher3/helper/a;ILjava/lang/String;Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
