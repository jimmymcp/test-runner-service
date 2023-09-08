codeunit 79153 "Store Performance"
{
    var
        SamplingPerformanceProfiler: Codeunit "Sampling Performance Profiler";

    internal procedure Start()
    begin
        SamplingPerformanceProfiler.Start();
    end;

    internal procedure Stop()
    begin
        SamplingPerformanceProfiler.Stop();
        Store();
    end;

    [InherentPermissions(PermissionObjectType::TableData, Database::"Performance Profiler Data", 'R')]
    internal procedure GetData(): Text
    var
        PerformanceProfilerData: Record "Performance Profiler Data";
    begin
        exit(PerformanceProfilerData.GetData());
    end;

    [InherentPermissions(PermissionObjectType::TableData, Database::"Performance Profiler Data", 'RIM')]
    local procedure Store()
    var
        PerformanceProfilerData: Record "Performance Profiler Data";
    begin
        PerformanceProfilerData.SetData(SamplingPerformanceProfiler.GetData());
    end;
}