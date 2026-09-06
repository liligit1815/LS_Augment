.class public interface abstract Lcom/android/systemui/plugins/CustomWidgetPlugin;
.super Ljava/lang/Object;
.source "CustomWidgetPlugin.java"

# interfaces
.implements Lx2/c;


# annotations
.annotation runtime Ly2/c;
    action = "com.android.systemui.action.PLUGIN_CUSTOM_WIDGET"
    version = 0x1
.end annotation


# static fields
.field public static final ACTION:Ljava/lang/String; = "com.android.systemui.action.PLUGIN_CUSTOM_WIDGET"

.field public static final VERSION:I = 0x1


# virtual methods
.method public abstract doUnlockAnim()V
.end method

.method public getId()Ljava/lang/String;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract getLabel()Ljava/lang/String;
.end method

.method public abstract getMinSpanX()I
.end method

.method public abstract getMinSpanY()I
.end method

.method public abstract getPreviewImage()I
.end method

.method public abstract getResizeMode()I
.end method

.method public abstract getSpanX()I
.end method

.method public abstract getSpanY()I
.end method

.method public bridge synthetic getVersion()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-super {p0}, Lx2/c;->getVersion()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public abstract getWidgetPadding(IIII)Landroid/graphics/Rect;
.end method

.method public abstract keyEventClick(Lcom/android/launcher3/widget/T;)V
.end method

.method public bridge synthetic onCreate(Landroid/content/Context;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lx2/c;->onCreate(Landroid/content/Context;Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic onDestroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Lx2/c;->onDestroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public abstract onLauncherDestroy()V
.end method

.method public abstract onLauncherModeChanged()V
.end method

.method public abstract onLauncherPaused()V
.end method

.method public abstract onLauncherResumed()V
.end method

.method public abstract onLauncherStarted()V
.end method

.method public abstract onLauncherStopped()V
.end method

.method public abstract onLoaderTaskBindAllApplications()V
.end method

.method public abstract onStateChangeStartMFV(Ljava/lang/String;)V
.end method

.method public abstract onViewCreated(Landroid/appwidget/AppWidgetHostView;)V
.end method

.method public abstract onWallpaperOrForeColorChanged()V
.end method

.method public abstract prepareOrResetUnlockAnim(Z)V
.end method

.method public updateWidgetInfo(Landroid/appwidget/AppWidgetProviderInfo;Landroid/content/Context;)V
    .locals 0

    .line 1
    return-void
.end method
