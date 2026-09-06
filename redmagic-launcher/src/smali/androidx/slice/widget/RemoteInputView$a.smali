.class Landroidx/slice/widget/RemoteInputView$a;
.super Ljava/lang/Object;
.source "RemoteInputView.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/slice/widget/RemoteInputView;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroidx/slice/widget/RemoteInputView;


# direct methods
.method constructor <init>(Landroidx/slice/widget/RemoteInputView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/RemoteInputView$a;->g:Landroidx/slice/widget/RemoteInputView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    if-nez p3, :cond_1

    .line 4
    .line 5
    const/4 v1, 0x6

    .line 6
    if-eq p2, v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x5

    .line 9
    if-eq p2, v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    if-ne p2, v1, :cond_1

    .line 13
    .line 14
    :cond_0
    move p2, v0

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    move p2, p1

    .line 17
    :goto_0
    if-eqz p3, :cond_2

    .line 18
    .line 19
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-static {v1}, Landroidx/slice/widget/RemoteInputView;->d(I)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    if-nez p3, :cond_2

    .line 34
    .line 35
    move p3, v0

    .line 36
    goto :goto_1

    .line 37
    :cond_2
    move p3, p1

    .line 38
    :goto_1
    if-nez p2, :cond_4

    .line 39
    .line 40
    if-eqz p3, :cond_3

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_3
    return p1

    .line 44
    :cond_4
    :goto_2
    iget-object p1, p0, Landroidx/slice/widget/RemoteInputView$a;->g:Landroidx/slice/widget/RemoteInputView;

    .line 45
    .line 46
    iget-object p1, p1, Landroidx/slice/widget/RemoteInputView;->g:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/widget/EditText;->length()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-lez p1, :cond_5

    .line 53
    .line 54
    iget-object p0, p0, Landroidx/slice/widget/RemoteInputView$a;->g:Landroidx/slice/widget/RemoteInputView;

    .line 55
    .line 56
    invoke-virtual {p0}, Landroidx/slice/widget/RemoteInputView;->g()V

    .line 57
    .line 58
    .line 59
    :cond_5
    return v0
.end method
