.class Landroidx/slice/widget/RemoteInputView$RemoteEditText$a;
.super Ljava/lang/Object;
.source "RemoteInputView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/slice/widget/RemoteInputView$RemoteEditText;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/view/inputmethod/InputMethodManager;

.field final synthetic h:Landroidx/slice/widget/RemoteInputView$RemoteEditText;


# direct methods
.method constructor <init>(Landroidx/slice/widget/RemoteInputView$RemoteEditText;Landroid/view/inputmethod/InputMethodManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/RemoteInputView$RemoteEditText$a;->h:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/slice/widget/RemoteInputView$RemoteEditText$a;->g:Landroid/view/inputmethod/InputMethodManager;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView$RemoteEditText$a;->g:Landroid/view/inputmethod/InputMethodManager;

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/slice/widget/RemoteInputView$RemoteEditText$a;->h:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/inputmethod/InputMethodManager;->viewClicked(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView$RemoteEditText$a;->g:Landroid/view/inputmethod/InputMethodManager;

    .line 9
    .line 10
    iget-object p0, p0, Landroidx/slice/widget/RemoteInputView$RemoteEditText$a;->h:Landroidx/slice/widget/RemoteInputView$RemoteEditText;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, p0, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method
