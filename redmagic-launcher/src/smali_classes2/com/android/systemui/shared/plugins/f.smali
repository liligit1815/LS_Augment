.class public final synthetic Lcom/android/systemui/shared/plugins/f;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/systemui/shared/plugins/PluginActionManager;

.field public final synthetic h:Lcom/android/systemui/shared/plugins/PluginInstance;


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/shared/plugins/PluginActionManager;Lcom/android/systemui/shared/plugins/PluginInstance;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/systemui/shared/plugins/f;->g:Lcom/android/systemui/shared/plugins/PluginActionManager;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/systemui/shared/plugins/f;->h:Lcom/android/systemui/shared/plugins/PluginInstance;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/plugins/f;->g:Lcom/android/systemui/shared/plugins/PluginActionManager;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/systemui/shared/plugins/f;->h:Lcom/android/systemui/shared/plugins/PluginInstance;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/systemui/shared/plugins/PluginActionManager;->f(Lcom/android/systemui/shared/plugins/PluginActionManager;Lcom/android/systemui/shared/plugins/PluginInstance;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
