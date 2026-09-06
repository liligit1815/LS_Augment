.class public final synthetic Ll3/d;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/window/OnBackInvokedCallback;


# instance fields
.field public final synthetic g:Ll3/b;


# direct methods
.method public synthetic constructor <init>(Ll3/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll3/d;->g:Ll3/b;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onBackInvoked()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll3/d;->g:Ll3/b;

    .line 2
    .line 3
    invoke-interface {p0}, Ll3/b;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
