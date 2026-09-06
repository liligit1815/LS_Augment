.class public final synthetic LA1/h;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/notification/NotificationListener$a;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/notification/NotificationListener$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LA1/h;->a:Lcom/android/launcher3/notification/NotificationListener$a;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, LA1/h;->a:Lcom/android/launcher3/notification/NotificationListener$a;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/notification/NotificationListener;->c(Lcom/android/launcher3/notification/NotificationListener$a;)Ljava/util/concurrent/Future;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
