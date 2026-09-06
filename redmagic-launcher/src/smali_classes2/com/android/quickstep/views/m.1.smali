.class public final synthetic Lcom/android/quickstep/views/m;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/views/FloatingWidgetView;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/FloatingWidgetView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/m;->g:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/m;->g:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/FloatingWidgetView;->fastFinish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
