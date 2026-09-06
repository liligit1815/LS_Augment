.class public final synthetic Lcom/android/quickstep/fallback/window/k;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/window/OnBackInvokedCallback;


# instance fields
.field public final synthetic g:Lu4/a;


# direct methods
.method public synthetic constructor <init>(Lu4/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/k;->g:Lu4/a;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onBackInvoked()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/k;->g:Lu4/a;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->j(Lu4/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
