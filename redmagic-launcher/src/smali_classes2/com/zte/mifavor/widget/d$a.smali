.class public Lcom/zte/mifavor/widget/d$a;
.super Ljava/lang/Object;
.source "AlertDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private final a:Lcom/zte/mifavor/widget/AlertController$f;

.field private b:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-static {p1, v0}, Lcom/zte/mifavor/widget/d;->resolveDialogTheme(Landroid/content/Context;I)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/zte/mifavor/widget/d$a;-><init>(Landroid/content/Context;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 3

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance v0, Lcom/zte/mifavor/widget/AlertController$f;

    new-instance v1, Landroid/view/ContextThemeWrapper;

    .line 4
    invoke-static {p1, p2}, Lcom/zte/mifavor/widget/d;->resolveDialogTheme(Landroid/content/Context;I)I

    move-result v2

    invoke-direct {v1, p1, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v0, v1}, Lcom/zte/mifavor/widget/AlertController$f;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 5
    iput p2, p0, Lcom/zte/mifavor/widget/d$a;->b:I

    return-void
.end method


# virtual methods
.method public a()Lcom/zte/mifavor/widget/d;
    .locals 4

    .line 1
    new-instance v0, Lcom/zte/mifavor/widget/d;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/zte/mifavor/widget/AlertController$f;->a:Landroid/content/Context;

    .line 6
    .line 7
    iget v2, p0, Lcom/zte/mifavor/widget/d$a;->b:I

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-direct {v0, v1, v2, v3}, Lcom/zte/mifavor/widget/d;-><init>(Landroid/content/Context;IZ)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/zte/mifavor/widget/d;->a(Lcom/zte/mifavor/widget/d;)Lcom/zte/mifavor/widget/AlertController;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v1, v2}, Lcom/zte/mifavor/widget/AlertController$f;->a(Lcom/zte/mifavor/widget/AlertController;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 23
    .line 24
    iget-boolean v1, v1, Lcom/zte/mifavor/widget/AlertController$f;->r:Z

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 30
    .line 31
    iget-boolean v1, v1, Lcom/zte/mifavor/widget/AlertController$f;->r:Z

    .line 32
    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object v1, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/zte/mifavor/widget/AlertController$f;->s:Landroid/content/DialogInterface$OnCancelListener;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/zte/mifavor/widget/AlertController$f;->t:Landroid/content/DialogInterface$OnDismissListener;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController$f;->u:Landroid/content/DialogInterface$OnKeyListener;

    .line 56
    .line 57
    if-eqz p0, :cond_1

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    return-object v0
.end method

.method public b(Z)Lcom/zte/mifavor/widget/d$a;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iput-boolean p1, v0, Lcom/zte/mifavor/widget/AlertController$f;->r:Z

    .line 4
    .line 5
    return-object p0
.end method

.method public c(Z)Lcom/zte/mifavor/widget/d$a;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "set Is Show Title, isShow="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "Z#AlertDialog"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 24
    .line 25
    iput-boolean p1, v0, Lcom/zte/mifavor/widget/AlertController$f;->V:Z

    .line 26
    .line 27
    return-object p0
.end method

.method public d(I)Lcom/zte/mifavor/widget/d$a;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/zte/mifavor/widget/AlertController$f;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, v0, Lcom/zte/mifavor/widget/AlertController$f;->h:Ljava/lang/CharSequence;

    .line 10
    .line 11
    return-object p0
.end method

.method public e(Ljava/lang/CharSequence;)Lcom/zte/mifavor/widget/d$a;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iput-object p1, v0, Lcom/zte/mifavor/widget/AlertController$f;->h:Ljava/lang/CharSequence;

    .line 4
    .line 5
    return-object p0
.end method

.method public f(ILandroid/content/DialogInterface$OnClickListener;)Lcom/zte/mifavor/widget/d$a;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/zte/mifavor/widget/AlertController$f;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, v0, Lcom/zte/mifavor/widget/AlertController$f;->l:Ljava/lang/CharSequence;

    .line 10
    .line 11
    iget-object p1, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 12
    .line 13
    iput-object p2, p1, Lcom/zte/mifavor/widget/AlertController$f;->m:Landroid/content/DialogInterface$OnClickListener;

    .line 14
    .line 15
    return-object p0
.end method

.method public g(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/zte/mifavor/widget/d$a;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iput-object p1, v0, Lcom/zte/mifavor/widget/AlertController$f;->l:Ljava/lang/CharSequence;

    .line 4
    .line 5
    iput-object p2, v0, Lcom/zte/mifavor/widget/AlertController$f;->m:Landroid/content/DialogInterface$OnClickListener;

    .line 6
    .line 7
    return-object p0
.end method

.method public h(ILandroid/content/DialogInterface$OnClickListener;)Lcom/zte/mifavor/widget/d$a;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/zte/mifavor/widget/AlertController$f;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, v0, Lcom/zte/mifavor/widget/AlertController$f;->p:Ljava/lang/CharSequence;

    .line 10
    .line 11
    iget-object p1, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 12
    .line 13
    iput-object p2, p1, Lcom/zte/mifavor/widget/AlertController$f;->q:Landroid/content/DialogInterface$OnClickListener;

    .line 14
    .line 15
    return-object p0
.end method

.method public i(Landroid/content/DialogInterface$OnDismissListener;)Lcom/zte/mifavor/widget/d$a;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iput-object p1, v0, Lcom/zte/mifavor/widget/AlertController$f;->t:Landroid/content/DialogInterface$OnDismissListener;

    .line 4
    .line 5
    return-object p0
.end method

.method public j(ILandroid/content/DialogInterface$OnClickListener;)Lcom/zte/mifavor/widget/d$a;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/zte/mifavor/widget/AlertController$f;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, v0, Lcom/zte/mifavor/widget/AlertController$f;->j:Ljava/lang/CharSequence;

    .line 10
    .line 11
    iget-object p1, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 12
    .line 13
    iput-object p2, p1, Lcom/zte/mifavor/widget/AlertController$f;->k:Landroid/content/DialogInterface$OnClickListener;

    .line 14
    .line 15
    return-object p0
.end method

.method public k(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/zte/mifavor/widget/d$a;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iput-object p1, v0, Lcom/zte/mifavor/widget/AlertController$f;->j:Ljava/lang/CharSequence;

    .line 4
    .line 5
    iput-object p2, v0, Lcom/zte/mifavor/widget/AlertController$f;->k:Landroid/content/DialogInterface$OnClickListener;

    .line 6
    .line 7
    return-object p0
.end method

.method public l(Z)Lcom/zte/mifavor/widget/d$a;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "set Recommend Button Text Color, isRecommend="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "Z#AlertDialog"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 24
    .line 25
    iput-boolean p1, v0, Lcom/zte/mifavor/widget/AlertController$f;->S:Z

    .line 26
    .line 27
    return-object p0
.end method

.method public m([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Lcom/zte/mifavor/widget/d$a;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iput-object p1, v0, Lcom/zte/mifavor/widget/AlertController$f;->v:[Ljava/lang/CharSequence;

    .line 4
    .line 5
    iput-object p3, v0, Lcom/zte/mifavor/widget/AlertController$f;->x:Landroid/content/DialogInterface$OnClickListener;

    .line 6
    .line 7
    iput p2, v0, Lcom/zte/mifavor/widget/AlertController$f;->I:I

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, v0, Lcom/zte/mifavor/widget/AlertController$f;->H:Z

    .line 11
    .line 12
    return-object p0
.end method

.method public n(I)Lcom/zte/mifavor/widget/d$a;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/zte/mifavor/widget/AlertController$f;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, v0, Lcom/zte/mifavor/widget/AlertController$f;->f:Ljava/lang/CharSequence;

    .line 10
    .line 11
    return-object p0
.end method

.method public o(Landroid/view/View;)Lcom/zte/mifavor/widget/d$a;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 2
    .line 3
    iput-object p1, v0, Lcom/zte/mifavor/widget/AlertController$f;->z:Landroid/view/View;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput p1, v0, Lcom/zte/mifavor/widget/AlertController$f;->y:I

    .line 7
    .line 8
    iput-boolean p1, v0, Lcom/zte/mifavor/widget/AlertController$f;->E:Z

    .line 9
    .line 10
    return-object p0
.end method

.method public p()Lcom/zte/mifavor/widget/d;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/d$a;->a()Lcom/zte/mifavor/widget/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v2, "show, P="

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v2, ", mIsRecommendTxt="

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 26
    .line 27
    iget-boolean v2, v2, Lcom/zte/mifavor/widget/AlertController$f;->S:Z

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v2, ", mNegativeTxtColor="

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget-object v2, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 38
    .line 39
    iget v2, v2, Lcom/zte/mifavor/widget/AlertController$f;->Z:I

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v2, ", mIsRecommendBackground="

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-object v2, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 50
    .line 51
    iget-boolean v2, v2, Lcom/zte/mifavor/widget/AlertController$f;->T:Z

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v2, ", mIsNegativeBackground="

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 62
    .line 63
    iget-boolean v2, v2, Lcom/zte/mifavor/widget/AlertController$f;->Y:Z

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v2, ", mIsServiceDialog="

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    iget-object v2, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 74
    .line 75
    iget-boolean v2, v2, Lcom/zte/mifavor/widget/AlertController$f;->R:Z

    .line 76
    .line 77
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    const-string v2, "Z#AlertDialog"

    .line 85
    .line 86
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    iget-object v1, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 90
    .line 91
    if-eqz v1, :cond_0

    .line 92
    .line 93
    iget-boolean v2, v1, Lcom/zte/mifavor/widget/AlertController$f;->S:Z

    .line 94
    .line 95
    if-eqz v2, :cond_0

    .line 96
    .line 97
    iget v1, v1, Lcom/zte/mifavor/widget/AlertController$f;->U:I

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/d;->setRecommendButtonTextColor(I)V

    .line 100
    .line 101
    .line 102
    :cond_0
    iget-object v1, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 103
    .line 104
    if-eqz v1, :cond_1

    .line 105
    .line 106
    iget-boolean v2, v1, Lcom/zte/mifavor/widget/AlertController$f;->X:Z

    .line 107
    .line 108
    if-eqz v2, :cond_1

    .line 109
    .line 110
    iget v1, v1, Lcom/zte/mifavor/widget/AlertController$f;->Z:I

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/d;->setNegativeButtonTextColor(I)V

    .line 113
    .line 114
    .line 115
    :cond_1
    iget-object v1, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 116
    .line 117
    if-eqz v1, :cond_2

    .line 118
    .line 119
    iget-boolean v1, v1, Lcom/zte/mifavor/widget/AlertController$f;->T:Z

    .line 120
    .line 121
    if-eqz v1, :cond_2

    .line 122
    .line 123
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/d;->setRecommendButtonBackground()V

    .line 124
    .line 125
    .line 126
    :cond_2
    iget-object v1, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 127
    .line 128
    if-eqz v1, :cond_3

    .line 129
    .line 130
    iget-boolean v1, v1, Lcom/zte/mifavor/widget/AlertController$f;->Y:Z

    .line 131
    .line 132
    if-eqz v1, :cond_3

    .line 133
    .line 134
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/d;->setNegativeButtonBackground()V

    .line 135
    .line 136
    .line 137
    :cond_3
    iget-object v1, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 138
    .line 139
    if-eqz v1, :cond_4

    .line 140
    .line 141
    iget-boolean v1, v1, Lcom/zte/mifavor/widget/AlertController$f;->V:Z

    .line 142
    .line 143
    if-eqz v1, :cond_4

    .line 144
    .line 145
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/d;->setIsShowTitle()V

    .line 146
    .line 147
    .line 148
    :cond_4
    iget-object v1, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 149
    .line 150
    if-eqz v1, :cond_5

    .line 151
    .line 152
    iget-boolean v1, v1, Lcom/zte/mifavor/widget/AlertController$f;->W:Z

    .line 153
    .line 154
    if-eqz v1, :cond_5

    .line 155
    .line 156
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/d;->closeSyncGravity()V

    .line 157
    .line 158
    .line 159
    :cond_5
    iget-object p0, p0, Lcom/zte/mifavor/widget/d$a;->a:Lcom/zte/mifavor/widget/AlertController$f;

    .line 160
    .line 161
    if-eqz p0, :cond_6

    .line 162
    .line 163
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/AlertController$f;->R:Z

    .line 164
    .line 165
    if-eqz p0, :cond_6

    .line 166
    .line 167
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/d;->setServiceDialog()V

    .line 168
    .line 169
    .line 170
    :cond_6
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/d;->show()V

    .line 171
    .line 172
    .line 173
    return-object v0
.end method
