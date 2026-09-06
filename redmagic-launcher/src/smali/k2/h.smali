.class public final synthetic Lk2/h;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lk2/k;

.field public final synthetic h:Lcom/android/systemui/plugins/CustomWidgetPlugin;

.field public final synthetic i:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lk2/k;Lcom/android/systemui/plugins/CustomWidgetPlugin;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lk2/h;->g:Lk2/k;

    .line 5
    .line 6
    iput-object p2, p0, Lk2/h;->h:Lcom/android/systemui/plugins/CustomWidgetPlugin;

    .line 7
    .line 8
    iput-object p3, p0, Lk2/h;->i:Landroid/content/Context;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lk2/h;->g:Lk2/k;

    .line 2
    .line 3
    iget-object v1, p0, Lk2/h;->h:Lcom/android/systemui/plugins/CustomWidgetPlugin;

    .line 4
    .line 5
    iget-object p0, p0, Lk2/h;->i:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lk2/k;->b(Lk2/k;Lcom/android/systemui/plugins/CustomWidgetPlugin;Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
