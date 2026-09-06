.class public final synthetic Lcom/android/quickstep/E1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/E1;->g:Landroid/view/View;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/E1;->g:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/OverviewCommandHelper;->b(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
