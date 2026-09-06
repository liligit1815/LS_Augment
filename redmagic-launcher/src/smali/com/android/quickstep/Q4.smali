.class public final synthetic Lcom/android/quickstep/Q4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/SystemUiProxy;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/SystemUiProxy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/Q4;->g:Lcom/android/quickstep/SystemUiProxy;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final binderDied()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/Q4;->g:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/SystemUiProxy;->c(Lcom/android/quickstep/SystemUiProxy;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
